//
//  ViewController.swift
//  CF-HW8
//
//  Created by AirRobert on 6/27/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  @IBAction func addBeer(sender: AnyObject) {
      let newBeer = Beer(type: "new Type", brewer: "new Brewer")
      self.beers.append(newBeer)
      println("new beer coming sort of")
      let selectedRow = beers.count - 1
      let selectedBeer = self.beers[selectedRow]
      println(selectedRow)
      self.tableView.reloadData()
  }

  var beers = [Beer]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Beers"
    
    if let beersFromArchive = self.loadBeersFromArchive(){
      self.beers = beersFromArchive
    } else {
      println("No archive")
      self.loadBeersFromPlist()
      println("loaded beers")
      self.saveBeersToArchive()
      println("saved beers")
    }
    self.tableView.dataSource = self
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "saveBeersToArchive", name: updatedTextNotificationKey, object: nil)
    // listens for notification from detailViewController to save updated information without reloading view
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    //self.saveBeersToArchive() //-> this is not needed with the NotificationCenter notice that the text has been updated
    self.tableView.reloadData()
  }

  private func loadBeersFromPlist(){
    if let beerPath = NSBundle.mainBundle().pathForResource("Beers", ofType: "plist"),
      beerObjects = NSArray(contentsOfFile: beerPath) as? [[String : String]]{
      for beer in beerObjects {
        if let beerType = beer["type"], beerBrewer = beer["brewer"]{
          let beercan = Beer(type: beerType, brewer: beerBrewer)
          self.beers.append(beercan)
          println("loaded a beer")
        }
      }
    }
  }

  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let title = "Beers of the World!"
    return title
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.beers.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BeerCell
    cell.beerImageView.layer.cornerRadius = 12
    cell.beerImageView.layer.masksToBounds = true
    cell.beerImageView.layer.borderColor = UIColor.greenColor().CGColor
    cell.beerImageView.layer.borderWidth = 1
 
    cell.testShadow.layer.shadowColor = UIColor.blackColor().CGColor
    cell.testShadow.layer.shadowOffset = CGSize(width: 2, height: 4)
    cell.testShadow.layer.shadowOpacity = 0.6
   
    let beerToDisplay = self.beers[indexPath.row]
    
    if let image = beerToDisplay.image {
      cell.beerImageView.image = image
    }
    cell.brewerLabel.text = beerToDisplay.brewer
    cell.typeLabel.text = beerToDisplay.type
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetailView" {
      println("basic segue")
      if let detailViewController = segue.destinationViewController as? DetailViewController,
        indexPath = self.tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedBeer = self.beers[selectedRow]
          detailViewController.selectedBeer = selectedBeer
      }
    }
  }
 
  
  func saveBeersToArchive(){
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      NSKeyedArchiver.archiveRootObject(self.beers, toFile: archivePath + "/archive")
      println("I saved the ales")
    }
  }
  
  func loadBeersFromArchive() -> [Beer]? {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      if let beersFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Beer]{
        return beersFromArchive
      }
    }
    return nil
  }
    
  
}






