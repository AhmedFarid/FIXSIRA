//
//  hoursDay.swift
//  Fixsira
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class hoursDay: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var openstuts: UILabel!
    @IBOutlet weak var opentime: UILabel!
    @IBOutlet weak var colseTime: UILabel!
    

    func configuerCell(prodect: workhoursssss) {
        day.text = prodect.day
        openstuts.text = prodect.check
        opentime.text = prodect.start
        colseTime.text = prodect.end
    }
}
