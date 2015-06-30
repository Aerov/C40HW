//
//  BeerCell.swift
//  CF-HW8
//
//  Created by AirRobert on 6/27/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell {

  
  @IBOutlet weak var brewerLabel: UILabel!
  
  @IBOutlet weak var typeLabel: UILabel!
  
  @IBOutlet weak var beerImageView: UIImageView!
  
  @IBOutlet weak var testShadow: UIView!

  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
