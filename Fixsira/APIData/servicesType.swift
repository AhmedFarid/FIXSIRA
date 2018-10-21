//
//  servicesType.swift
//  Fixsira
//
//  Created by FARIDO on 10/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class servicesType: NSObject {
    
    var id: Int
    var models: String
    var manufacturer: String
    var manufacturer_id: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let models = dict["models"]?.string,let manufacturer = dict["manufacturer"]?.string, let manufacturer_id = dict["manufacturer_id"]?.string else {return nil}
        
        self.id = id
        self.models = models
        self.manufacturer = manufacturer
        self.manufacturer = manufacturer
        self.manufacturer_id = manufacturer_id
        
    }
}

class servicestypes: NSObject {
    
    var id: Int
    var name: String
    var desc_txt: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let name = dict["name"]?.string,let desc_txt = dict["desc_txt"]?.string else {return nil}
        
        self.id = id
        self.name = name
        self.desc_txt = desc_txt
        
    }
}
