//
//  ViewController.swift
//  CF-C40-HW6
//
//  Created by AirRobert on 6/18/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
 

  @IBOutlet weak var tableView: UITableView!
  
  var planes = [Airplane]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    // I've forgotten this several times now. need it to establish the data source for the table view
    
    let piper = Airplane(planeMake: "Piper", planeModel: "PA-28 Archer")
    let cessna = Airplane(planeMake: "Cessna", planeModel: "C-172 Skyhawk")
    let diamond = Airplane(planeMake: "Diamond", planeModel: "D-40 Katana")
    
    self.planes.append(piper)
    self.planes.append(cessna)
    self.planes.append(diamond)
    
    //let imageC = UIImage(data: Cessna_2010_1280x1024.jpg)
    //cessna.planeImage = imageC
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }


  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let title = "Airplanes are Groovy"
    return title
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return planes.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // this method returns the cell contents for the table view...and is part of the protocol required as the delegate for the Table View
    
    if let cell = self.tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) as? UITableViewCell
    // this casts the constant 'cell' as a UITableViewCell, since this protocol method has to return a cell
    
    let plane = self.planes[indexPath.row]
    

    
    cell.textLabel?.text = plane.planeMake + " " + plane.planeModel
    return cell
    

  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      let detailViewController = segue.destinationViewController as! DetailViewController
      
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedPlane = self.planes[selectedRow]
      detailViewController.selectedPlane = selectedPlane
    }
  }
  
}

