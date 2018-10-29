//
//  vendorProfile.swift
//  Fixsira
//
//  Created by FARIDO on 10/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class vendorProfile: NSObject {
    
    var id: Int
    var vendor_id: String
    var name: String
    var address: String
    var descri: String
    var phone: String
    var telephone: String
    var lat: String
    var lng: String

    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int,let name = dict["name"]?.string, let address = dict["address"]?.string,let descri = dict["description"]?.string, let phone = dict["phone"]?.string, let telephone = dict["telephone"]?.string, let lat = dict["lat"]?.string, let lng = dict["lng"]?.string,let vendor_id = dict["vendor_id"]?.string else {return nil}
        
        self.id = id
        self.vendor_id = vendor_id
        self.name = name
        self.descri = descri
        self.address = address
        self.phone = phone
        self.telephone = telephone
        self.lat = lat
        self.lng = lng
        
    }
}

