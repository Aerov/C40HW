//
//  ViewController.swift
//  CF-C40-HW4-Vets
//
//  Created by AirRobert on 6/11/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  
  @IBOutlet weak var tableView: UITableView!
  
  var raceDrivers = [RacingDriver]()
  
  // "There are only three sports: bullfighting, motor racing, and mountaineering; all the rest are merely games." E. Hemingway
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self //just cause
    
    
    let michael = RacingDriver(firstName: "Michael", lastName: "Schumacher")
    let mario = RacingDriver(firstName: "Mario", lastName: "Andretti")
    let aryton = RacingDriver(firstName: "Aryton", lastName: "Senna")
    let stig = RacingDriver(firstName: "Stig", lastName: " ")
   
    self.raceDrivers.append(mario)
    self.raceDrivers.append(aryton)
    self.raceDrivers.append(michael)
    self.raceDrivers.append(stig)
  }

  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Race Drivers"
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) as! UITableViewCell
    let driver = self.raceDrivers[indexPath.row]
    cell.textLabel?.text = driver.firstName + " " + driver.lastName
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.raceDrivers.count
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController"{
      
      let detailViewController = segue.destinationViewController as! DetailViewController
      
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedDriver = self.raceDrivers[selectedRow]
      detailViewController.selectedDriver = selectedDriver
      //
    }
  }
  
}

