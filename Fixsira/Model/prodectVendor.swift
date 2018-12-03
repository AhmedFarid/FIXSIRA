//
//  prodectVendor.swift
//  Fixsira
//
//  Created by farido on 11/27/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class prodectVendor: UITableViewCell {

    @IBOutlet weak var prodactName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imag: UIImageView!
    @IBOutlet weak var desicount: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var avg: UILabel!
    @IBOutlet weak var stoke: UILabel!
    
    func configuerCell(prodect: SparParts) {
        stoke.text = prodect.stock_availability
        avg.text = "rate This\(prodect.rate_average)"
        rate.text = "\(prodect.rate_total)"
        desicount.text = "Discount:\(prodect.regular_price)"
        prodactName.text = "\(prodect.title)"
        price.text = "Price:\(prodect.price)"
        imag.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/\(prodect.image_url)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        imag.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            imag.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
