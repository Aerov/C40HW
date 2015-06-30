//
//  DetailedViewController.swift
//  CF-C40-HW5
//
//  Created by AirRobert on 6/18/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var locationText: UITextField!
  @IBOutlet weak var trackName: UITextField!
  
  var selectedTrack : RaceTrack!
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.nameLabel.text = self.selectedTrack.trackName
      self.locationText.text = self.selectedTrack.trackLocation
      self.trackName.text = self.selectedTrack.trackName
      
      self.trackName.delegate = self
      self.locationText.delegate = self

      
      self.locationText.tag = 0
      self.trackName.tag = 1
      
    }


  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    return false
  }

  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedTrack.trackLocation = textField.text
    } else {
      self.selectedTrack.trackName = textField.text
    }

  }


}
