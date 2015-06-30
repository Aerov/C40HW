//
//  ViewController.swift
//  CF-C40-HW7
//
//  Created by AirRobert on 6/22/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
 
  var cities = [City]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.loadCitiesFromPlist()
    self.tableView.dataSource = self
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
    
  }
  
  private func  loadCitiesFromPlist() {
    if let cityPath = NSBundle.mainBundle().pathForResource("Cities", ofType: "plist"),
      cityObjects = NSArray(contentsOfFile: cityPath) as? [[String : String]] {
        for places in cityObjects {
          if let cityName = places["cityName"], countryName = places["countryName"]{
            let city = City(city: cityName, country: countryName)
            self.cities.append(city)
          }
        }
        
    }
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let title = "Cities of Interest"
    return title
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.cities.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    println("I got here")
    let cell = self.tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath) as! TableViewCell
    let cityToDisplay = self.cities[indexPath.row]
    
    if let image = cityToDisplay.image {
      cell.cityImageView.image = image
      println("city to display image is there")
    }
    
    cell.cityNameLabel.text = cityToDisplay.cityName
    cell.countryNameLabel.text = cityToDisplay.countryName
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetailViewController" {
      if let detailViewController = segue.destinationViewController as? DetailViewController {
        if let indexPath = self.tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedCity = self.cities[selectedRow]
          detailViewController.selectedCity = selectedCity
        }
      } // this can be cleaned up
    }
  }
  
  

}

