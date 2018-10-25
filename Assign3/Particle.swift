//
//  Particle.swift
//  Assign3
//
//  Created by Steven Senger on 9/19/18.
//  Copyright © 2018 Steven Senger. All rights reserved.
//

import UIKit

class Particle: NSObject {
  
    var position = CGPoint()
    var velocity = CGPoint()
    
  //make sure the particle cannot leave the screen
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    var goingUp = false
   // var goingRight = true;
    
    //boolean to tell the particle to stop bouncing if the latest peak bounce is close to the ground
    var dampered = false;
    
    //use this var to keep track of dampering
    var topPoint = CGPoint()
    
    //give each particle a tail
    var tail = UIBezierPath()
    
    //use this variable to 
    let startTime = Date()
    
    func updatePosition() {
        //determine what direction the ball is heading
        if( dampered == false ){
            getDirection()
            if( goingUp ){
                //slow down the speed of the particle on the way up
                velocity.y = velocity.y - 1.3
                position.y -= velocity.y
            }
            else{
                //speed up the particle on the way down
                velocity.y = velocity.y + 1
                position.y += velocity.y
            }
            //slow down the velocity just a tad
            velocity.x =  velocity.x * 0.99
            position.x += velocity.x
            
            if( topPoint.y >=  screenHeight-5 ){
                dampered = true
                velocity.x = 0
                velocity.y = 0
            }
        }
    }
    /*
     * Helper function to get the position of the ball on the screen
     */
    func getDirection(){
        //if the particle hits the bottom of the screen send it up
        if( position.y >= screenHeight ){
            goingUp = true
        }
        //if the particle hits the top of the screen send it down
        if( position.y <= 0 || velocity.y <= 0){
            goingUp = false
            topPoint.y = position.y
        }
        //if the particle hits a side of the screen reverse the direction of the velocity
        if( position.x <= 0 || position.x >= screenWidth ){
            velocity.x = velocity.x * -1
        }
    }
    
    /*
     * Helper function to draw the tail on the particle
     */
    func drawTail(){
        if( dampered == true ){
            //if the particle is done bouncing turn its tail red (debug purposes, kind of cool though)
            UIColor.red.set()
        }
        tail.removeAllPoints()
        let centerPoint = CGPoint(x: position.x, y: position.y )
        let tailPoint = calcTailDirection()
        tail.move(to: centerPoint)
        tail.addLine(to: tailPoint)
        tail.lineWidth = 3
        tail.close()
        tail.stroke()
        UIColor.yellow.set()
    }
    
    /*
     * Helper function to help determine where the tail of each particle should go
     */
    func calcTailDirection() -> CGPoint {
        var tailDirection = CGPoint()
        if(goingUp){
            //put the tail down if the particle is going up
            tailDirection.y = position.y+10
        }
        else{
            //put the tail up if the particle is going down
            tailDirection.y = position.y-10
        }
        
        if( velocity.x == 0 ){
            //if the particle isn't moving left and right
            tailDirection.x = position.x
        }
        else{
            //draw the tail the opposite direction of the velocity
            tailDirection.x = position.x + CGFloat((isNegative(num: velocity.x)*10))
        }
      
        return tailDirection
    }
    
    /*
     * Helper function to calculate the tail based off of the direction of the x velocity
     */
    func isNegative( num: CGFloat ) -> Int {
        if( num < 0 ) {
            return 1;
        }
        else{
            return -1;
        }
    }
    
    func draw() {
        let rect = CGRect(x: position.x, y: position.y, width: 0, height: 0).insetBy(dx: -5, dy: -5)
        UIBezierPath(ovalIn: rect).fill()
    }
}
