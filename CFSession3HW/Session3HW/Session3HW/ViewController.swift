//
//  ViewController.swift
//  Session3HW
//
//  Created by AirRobert on 6/10/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var racingTeams = [String]()
  var racingTracks = [String]()
  let numberOfSections = 2
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    
    self.racingTeams.append("Ferrari")
    self.racingTeams.append("Lotus")
    self.racingTeams.append("McLaren")
    self.racingTeams.append("RedBull")
    self.racingTeams.append("Williams")
    self.racingTeams.append("Sauber")
    
    self.racingTracks.append("SPA-Francorchamps: Belgium")
    self.racingTracks.append("Monza: Italy")
    self.racingTracks.append("NurburgRing: Germany")
    self.racingTracks.append("Suzuka: Japan")
    self.racingTracks.append("Montreal: Canada")
    self.racingTracks.append("Watkins Glen: USA")
    self.racingTracks.append("Laguna Seca: USA")
    self.racingTracks.append("Monaco...")
    self.racingTracks.append("San Paulo: Brazil")
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    println("checking that view will appear")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    // this is not actually doing anything here but calling the superClass method
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    println("viewDidAppear, yo")
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return numberOfSections
    // this is not required for the UITableViewDataSource delegate
  }
  
  //The following two functions are required for the UITableViewDataSource
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return self.racingTeams.count
    } else {
      return self.racingTracks.count
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) as! UITableViewCell
    
    cell.backgroundColor = UIColor.whiteColor()
    
    if indexPath.section == 0 {
      let nameToDisplay = self.racingTeams[indexPath.row]
      cell.textLabel?.text = nameToDisplay
    } else {
      let nameToDisplay = self.racingTracks[indexPath.row]
      cell.textLabel?.text = nameToDisplay
    }
    return cell
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "Racing Teams"
    } else {
      return "Groovy Race Tracks"
    }
  }
}

