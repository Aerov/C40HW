//
//  DetailViewController.swift
//  CF-C40-HW4-Vets
//
//  Created by AirRobert on 6/11/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
  
  @IBOutlet weak var firstNameLabel: UILabel!
  
  @IBOutlet weak var lastNameLabel: UILabel!
  
  var selectedDriver : RacingDriver!

    override func viewDidLoad() {
        super.viewDidLoad()
      self.firstNameLabel.text = self.selectedDriver.firstName
      self.lastNameLabel.text = self.selectedDriver.lastName
      

        // Do any additional setup after loading the view.
    }



}
