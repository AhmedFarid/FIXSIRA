//
//  carMaintDetailsCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class carMaintDetailsCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    
    
    func configuerCell(prodect: vendorProfile) {
        
        name.text = prodect.name
        des.text = prodect.address
    }
    
}
