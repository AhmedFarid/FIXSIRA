//
//  servicesDetails.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class servicesDetails: NSObject {
    var id: Int
    var name: String
    var descrip: String
    var price: String
    var img: String
    //var descrip: String
    var rate: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let name = dict["name"]?.string, let descrip = dict["description"]?.string, let price = dict["price"]?.string, let img = dict["img"]?.string , let rate = dict["rate"]?.string else {return nil}
        
        self.id = id
        self.name = name
        self.descrip = descrip
        self.img = img
        self.rate = rate
        self.price = price
    }
}

