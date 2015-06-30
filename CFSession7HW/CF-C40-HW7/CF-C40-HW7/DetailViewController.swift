//
//  DetailViewController.swift
//  CF-C40-HW7
//
//  Created by AirRobert on 6/23/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var cityTextField: UITextField!
  @IBOutlet weak var countryTextField: UITextField!
  @IBOutlet weak var cityImageView: UIImageView!
  
  var selectedCity : City!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.loadTextFields()
  }
  
  private func loadTextFields() {
    self.cityTextField.delegate = self
    self.countryTextField.delegate = self
    self.cityTextField.tag = 0
    self.countryTextField.tag = 1
    self.cityTextField.text = self.selectedCity.cityName
    self.countryTextField.text = self.selectedCity.countryName
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedCity.cityName = textField.text
    } else {
      self.selectedCity.countryName = textField.text
    }
  }
  @IBAction func photoButtonPressed(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.cityImageView.image = image
    self.selectedCity.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
}