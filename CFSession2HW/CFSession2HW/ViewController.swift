//
//  ViewController.swift
//  CFSEA40 - Session2HW
//
//  Created by AirRobert on 6/7/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var myArray = ["One", "Two", "Three", "Four", "Five"]
  var myCounter: Int = 0
  
  
  @IBOutlet weak var TextThing: UILabel!
  
  
  @IBAction func Button(sender: AnyObject) {
    
    self.view.backgroundColor = UIColor.greenColor()
    
    if self.myCounter == 0 {
      self.TextThing.text = self.myArray[myArray.count - 1]
      self.myCounter = myArray.count-1
      } else {
      self.TextThing.text = self.myArray[self.myCounter - 1]
      self.myCounter -= 1
    }
  }
  

  @IBAction func Button2(sender: AnyObject) {
     self.view.backgroundColor = UIColor.whiteColor()
    
    if self.myCounter == myArray.count - 1 {
      self.TextThing.text = self.myArray[0]
      self.myCounter = 0
    } else {
      self.TextThing.text = self.myArray[self.myCounter + 1]
      self.myCounter += 1
    }
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

