//
//  Services.swift
//  Fixsira
//
//  Created by FARIDO on 10/11/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//"telephone" : "123456789",
//"rate_total" : 0,
//"phone" : "123456789",
//"user_photo_url" : "",
//"vendor_id" : "14",
//"description" : "فرع المهندسين",
//"lng" : "31.207575478553622",
//"address" : "فرع المهندسين",
//"rate_average" : 0,
//"id" : 1,
//"vendor_name" : "Motor Workers",
//"lat" : "30.058025884814295",
//"name" : "فرع المهندسين"

import UIKit
import SwiftyJSON

class Services: NSObject {
    
    var id: Int
    var vendor_name: String
    var user_photo_url: String
    var name: String
    var address: String
    //var descrip: String
    var phone: String
    var telephone: String
    var lat: String
    var lng: String
    var rate_total: Int
    var rate_average: Int
    var price: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let vendor_name = dict["vendor_name"]?.string, let user_photo_url = dict["user_photo_url"]?.string, let name = dict["name"]?.string, let address = dict["address"]?.string, let phone = dict["phone"]?.string, let telephone = dict["telephone"]?.string, let lat = dict["lat"]?.string, let lng = dict["lng"]?.string,  let rate_total = dict["rate_total"]?.int,let rate_average = dict["rate_average"]?.int,let price = dict["price"]?.string else {return nil}
        
        self.id = id
        self.vendor_name = vendor_name
        self.user_photo_url = user_photo_url
        self.name = name
        self.address = address
        //self.descrip = description
        self.phone = phone
        self.telephone = telephone
        self.lat = lat
        self.lng = lng
        self.rate_total = rate_total
        self.rate_average = rate_average
        self.price = price
    }
}
