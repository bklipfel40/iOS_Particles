//
//  ViewController.swift
//  Assign3
//
//  Created by Steven Senger on 9/19/18.
//  Copyright © 2018 Steven Senger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    //add a timer to call updateParticles every 30th of a second int the BounceView View
    let timer = Timer(timeInterval: 1/30.0, repeats: true, block: {(v) -> Void in (self.view as! BounceView).updateParticles()})
    //add the timer to RunLoop in the default Mode
    RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

