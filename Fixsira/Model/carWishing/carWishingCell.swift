//
//  carWishingCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/11/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class carWishingCell: UITableViewCell {

    @IBOutlet weak var wishImage: UIImageView!
    @IBOutlet weak var vrndorName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var telephone: UILabel!
    @IBOutlet weak var reate: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    
    func configuerCell(prodect: Services) {
        
        vrndorName.text = prodect.centerName
        name.text = prodect.vendorName
        address.text = prodect.centerAddress
        //phone.text = "\(prodect.totalPrice)"
        telephone.text = "\(prodect.total) Rate This"
        reate.text = "\(prodect.rating)"
        
        wishImage.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/\(prodect.image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        wishImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            wishImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
