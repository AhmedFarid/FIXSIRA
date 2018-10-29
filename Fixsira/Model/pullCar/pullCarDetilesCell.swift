//
//  pullCarDetilesCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class pullCarDetilesCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var Distance: UILabel!
    
    
    func configuerCell(prodect: servicesDetails) {
        
        name.text = prodect.name
        des.text = prodect.descrip
        price.text = prodect.price
        rate.text = prodect.rate
        
        img.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/site\(prodect.img)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        img.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            img.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
