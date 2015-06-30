//
//  ViewController.swift
//  CF-C40-HW5
//
//  Created by AirRobert on 6/18/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var raceTracks = [RaceTrack]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    
    let suzuka = RaceTrack(trackName: "Suzuka", trackLocation: "Japan")
    let nurburgring = RaceTrack(trackName: "Nurburgring", trackLocation: "Germany")
    let spa = RaceTrack(trackName: "Circuit de SPA-Francorchamps", trackLocation: "Belgium")
    let monza = RaceTrack(trackName: "Monza", trackLocation: "Italy")
    let montreal = RaceTrack(trackName: "Montreal", trackLocation: "Canada")
    let barcelona = RaceTrack(trackName: "Circuit de Catalunya", trackLocation: "Spain")
    
    self.raceTracks.append(suzuka)
    self.raceTracks.append(monza)
    self.raceTracks.append(spa)
    self.raceTracks.append(nurburgring)
    self.raceTracks.append(montreal)
    self.raceTracks.append(barcelona)
    
  }


  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) as! UITableViewCell
    let track = self.raceTracks[indexPath.row]
    cell.textLabel?.text = track.trackName + ", " + track.trackLocation
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
    return self.raceTracks.count
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let title = "Tracks"
    return title
  }
  
  override func viewWillAppear(animated: Bool) {
    
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "ShowDetailViewController"{
      let detailViewController = segue.destinationViewController as! DetailedViewController
      
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedTrack = self.raceTracks[selectedRow]
      detailViewController.selectedTrack = selectedTrack
    }
    
  }

}

