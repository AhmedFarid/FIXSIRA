//
//  servicesVendor.swift
//  Fixsira
//
//  Created by FARIDO on 10/28/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class servicesVendor: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    func configuerCell(prodect: servicesDetails) {
        
        name.text = prodect.name
        price.text = prodect.price
    }

}
