//
//  bannerData.swift
//  Fixsira
//
//  Created by AhmedFarid on 11/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class bannerData: NSObject {
    
    var id: String
    var img: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string, let img = dict["img"]?.string else {return nil}
        
        self.id = id
        self.img = img
        
    }
}
