//
//  BounceView.swift
//  Assign3
//
//  Created by Steven Senger on 9/19/18.
//  Copyright © 2018 Steven Senger. All rights reserved.
//

import UIKit
//use the filter to filter the particle array to include only points that haven't expired

class BounceView: UIView {
  
  var particles = [Particle]()
  var addingParticles = false
  var lastTouchPoint = CGPoint()
  var lastVelocity : CGFloat = 0.0
  var newVelocity  : CGFloat = 0.0
  
  func updateParticles() {
    if addingParticles {
      addParticle(at: lastTouchPoint, with: CGPoint(x: 0, y: 0))
    }
    for particle in particles {
      particle.updatePosition()
    }
    //get the current date to compare how long each particle has existed
    let curDate = Date()
    //print( curDate.timeIntervalSince1970 )
    //remove all particles that have existed for 12 seconds or longer
    particles = particles.filter{ curDate.timeIntervalSince($0.startTime) <= 12.0 }
    self.setNeedsDisplay()
  }
  
  func addParticle(at pt: CGPoint, with vel: CGPoint) {
    if particles.count > 300 { return }
    let particle = Particle()
    particle.position = pt
    particle.velocity = vel
    //slow down the x velocity to make it more realistic
    particle.velocity.x = newVelocity/5
    particles.append(particle)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //get the touch coordinates of the BounceView self=BounceView
    lastTouchPoint = touches.first!.location(in: self)
    addingParticles = true
    //remember the value of the last velocity
    lastVelocity = lastTouchPoint.x
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let pt = touches.first!.location(in: self)
    lastTouchPoint = pt
    addingParticles = true
    //get the value of the new velocity if we are dragging the mouse in a direction
    newVelocity = lastTouchPoint.x - lastVelocity
  }
 
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //reset the velocity **fixes bug where next touch would resume the previous horizontal velocity even if the cursor did not move
    newVelocity = 0
    addingParticles = false
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    addingParticles = false
  }

  override func draw(_ rect: CGRect) {
    UIColor.yellow.set()
    for particle in self.particles {
      particle.draw()
        particle.drawTail()
    }
  }
}
