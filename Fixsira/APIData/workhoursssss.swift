//
//  workhoursssss.swift
//  Fixsira
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class workhoursssss: NSObject {

    var day: String
    var check: String
    var start: String
    var end: String
    
    init?(dict: [String: JSON]){
        
        guard let day = dict["day"]?.string, let check = dict["check"]?.string,let start = dict["start"]?.string, let end = dict["end"]?.string else {return nil}
        
        self.day = day
        self.check = check
        self.start = start
        self.end = end
        
    }
}
