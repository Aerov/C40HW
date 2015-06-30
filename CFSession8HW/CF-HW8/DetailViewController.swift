//
//  DetailViewController.swift
//  CF-HW8
//
//  Created by AirRobert on 6/27/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

let updatedTextNotificationKey = "updatedNotificationKey"

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var brewerTextField: UITextField!
  @IBOutlet weak var beerTypeTextField: UITextField!
  @IBOutlet weak var beerImageView: UIImageView!
  
  var selectedBeer : Beer!
  
  override func viewDidLoad() {
    println("in detail view now")
    super.viewDidLoad()
    self.loadTextFields()
    title = "Beer Detail"
  }
  
  private func loadTextFields(){
    self.beerTypeTextField.delegate = self
    self.brewerTextField.delegate = self
    self.beerTypeTextField.tag = 0
    self.brewerTextField.tag = 1
    if let checkBeer = selectedBeer {
      self.beerTypeTextField.text = self.selectedBeer.type
      self.brewerTextField.text = self.selectedBeer.brewer
      self.beerImageView.image = self.selectedBeer.image
    } else {
      self.beerTypeTextField.text = "type"
      self.brewerTextField.text = "brewer"
    }
    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    self.notify()
    return false
    // add this to dismiss the keyboard
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedBeer.type = textField.text
    } else {
      self.selectedBeer.brewer = textField.text
    }
  }
  @IBAction func notify(){
      NSNotificationCenter.defaultCenter().postNotificationName(updatedTextNotificationKey, object: self)
  }
  
  @IBAction func photoButtonPressed(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.selectedBeer.image = image
    self.beerImageView.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
}
