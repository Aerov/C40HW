//
//  TableViewCell.swift
//  CF-C40-HW7
//
//  Created by AirRobert on 6/23/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var cityNameLabel: UILabel!
  
  @IBOutlet weak var countryNameLabel: UILabel!

  @IBOutlet weak var cityImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(selected: Bool,animated: Bool) {
    super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
  }

}


