//
//  myProdectDetiles.swift
//  Fixsira
//
//  Created by FARIDO on 10/19/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class myProdectDetiles: UITableViewCell {
    
    @IBOutlet weak var prodectName: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imag: UIImageView!
    
    func configuerCell(prodect: myordersProdectDetels) {
        
        prodectName.text = "\(prodect.name)"
        quantity.text = prodect.quantity
        price.text = prodect.price
        imag.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/site\(prodect.img_src)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        imag.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            imag.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
}
}
