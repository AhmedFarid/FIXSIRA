//
//  myordersCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/15/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class myordersCell: UITableViewCell {

    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carModle: UILabel!
    @IBOutlet weak var carModleYear: UILabel!
    @IBOutlet weak var serviceType: UILabel!
    @IBOutlet weak var DateSuc: UILabel!
    @IBOutlet weak var dataAdd: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    func configuerCell(prodect: myorders) {
        
        carName.text = prodect.car_name
        carModle.text = prodect.car_model
        carModleYear.text = prodect.car_model_year
        serviceType.text = prodect.services_type
        DateSuc.text = prodect.schedule_date
        dataAdd.text = prodect.date_added
        price.text = prodect.price
        status.text = prodect.status
    }
    
}

