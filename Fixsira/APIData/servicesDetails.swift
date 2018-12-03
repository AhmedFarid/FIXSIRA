//
//  servicesDetails.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//
//
//"img" : "\/public\/uploads\/1542628879-h-100-iconfixera.png",
//"averageRate" : 0,
//"description" : "ajhsjdhjs",
//"rate" : 0,
//"serviceId" : "5",
//"locationId" : "2",
//"name" : "Mansour",
//"price" : "200"

import UIKit
import SwiftyJSON

class servicesDetails: NSObject {
    
    var img: String
    var averageRate: Int
    var descrip: String
    var rate: Int
    var id: String
    var locationId: String
    var name: String
    var price: String
    var serviceId: String
    
    init?(dict: [String: JSON]){
        
        guard let img = dict["img"]?.string, let averageRate = dict["averageRate"]?.int, let descrip = dict["description"]?.string, let rate = dict["rate"]?.int, let id = dict["serviceId"]?.string , let locationId = dict["locationId"]?.string, let name = dict["name"]?.string, let serviceId = dict["serviceId"]?.string,let price = dict["price"]?.string else {return nil}
        
        self.id = id
        self.name = name
        self.descrip = descrip
        self.img = img
        self.rate = rate
        self.price = price
        self.locationId = locationId
        self.averageRate = averageRate
        self.serviceId = serviceId
    }
}

