//
//  Beer.swift
//  CF-HW8
//
//  Created by AirRobert on 6/27/15.
//  Copyright (c) 2015 Robert Vets. All rights reserved.
//

import UIKit

class Beer : NSObject, NSCoding {
  
  var type : String
  var name : String?
  var brewer : String
  var image : UIImage?
  
  init (type: String, brewer: String){
    self.type = type
    self.brewer = brewer
  }
  
  required init(coder aDecoder: NSCoder){
    self.type = aDecoder.decodeObjectForKey("type") as! String
    self.name = aDecoder.decodeObjectForKey("name") as? String
    self.brewer = aDecoder.decodeObjectForKey("brewer") as! String
    self.image = aDecoder.decodeObjectForKey("image") as? UIImage
    
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.type, forKey: "type")
    aCoder.encodeObject(self.name, forKey: "name")
    aCoder.encodeObject(self.brewer, forKey: "brewer")
    aCoder.encodeObject(self.image, forKey: "image")
    
  }
  
}
