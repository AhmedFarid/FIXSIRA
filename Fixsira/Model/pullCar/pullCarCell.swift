//
//  pullCarCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/12/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class pullCarCell: UITableViewCell {
    
    @IBOutlet weak var wishImage: UIImageView!
    @IBOutlet weak var vrndorName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var reate: UILabel!
    @IBOutlet weak var rateAvg: UILabel!
    
    
    func configuerCell(prodect: Services) {
        
        vrndorName.text = prodect.vendor_name
        name.text = prodect.name
        address.text = prodect.address
        rateAvg.text = "\(prodect.rate_average) Rate This"
        //telephone.text = prodect.telephone
        reate.text = "\(prodect.rate_total)"
        
        wishImage.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/site\(prodect.user_photo_url)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        wishImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            wishImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
