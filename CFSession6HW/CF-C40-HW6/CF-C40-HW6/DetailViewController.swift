//
//  DetailViewController.swift
//  CF-C40-HW6
//
//  Created by AirRobert on 6/18/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  // to use a text field, assume delegate, conform to protocol

  @IBOutlet weak var planeMakeText: UITextField!
  @IBOutlet weak var planeModelText: UITextField!
  @IBOutlet weak var planeImageView: UIImageView!
  
  var selectedPlane : Airplane!
  // declares the property of the detailed view controller class to be an airplane class object...
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.planeMakeText.text = self.selectedPlane.planeMake
      self.planeModelText.text = self.selectedPlane.planeModel
      self.planeImageView.image = self.selectedPlane.planeImage
      // thank you TA dude..
      
      self.planeMakeText.delegate = self
      self.planeModelText.delegate = self
    
      self.planeMakeText.tag = 0
      self.planeModelText.tag = 1

    }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    // 1 of 2 required methods for the Delegate protocol
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    // 2 of 2 required methods for the Delegate protocol
    if textField.tag == 0 {
      self.selectedPlane.planeMake = textField.text
    } else {
      self.selectedPlane.planeModel = textField.text
    }
  }
  
  @IBAction func imageButton(sender: AnyObject) {
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.planeImageView.image = image
    self.selectedPlane.planeImage = image
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }

  
}
