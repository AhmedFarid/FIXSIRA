//
//  myProdectOrderCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/19/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class myProdectOrderCell: UITableViewCell {
    
    @IBOutlet weak var orderID: UILabel!
    @IBOutlet weak var orderTotal: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    
    var reviewBTN: (() -> Void)?

    func configuerCell(prodect: myordersProdect) {
        
        orderID.text = "\(prodect.id)"
        orderTotal.text = prodect._final_order_total
        orderDate.text = prodect._order_date
        orderStatus.text = prodect._order_status
    }
    
    @IBAction func reviewBTN(_ sender: Any) {
        reviewBTN?()
    }
}
