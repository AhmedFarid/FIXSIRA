//
//  commets.swift
//  Fixsira
//
//  Created by farido on 12/20/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class commets: NSObject {
    
    var name: String
    var comment: String
    var rating: String
    var date: String
    
    init?(dict: [String: JSON]){
        
        guard let name = dict["name"]?.string, let comment = dict["comment"]?.string,let rating = dict["rating"]?.string, let date = dict["date"]?.string else {return nil}
        
        self.name = name
        self.comment = comment
        self.rating = rating
        self.date = date
        
        
    }
}
