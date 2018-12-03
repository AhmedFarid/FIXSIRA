//
//  bannerCell.swift
//  Fixsira
//
//  Created by AhmedFarid on 11/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class bannerCell: UICollectionViewCell {
    
    
    @IBOutlet weak var Image: UIImageView!
    
    func configuerCell(prodect: bannerData) {
        
        Image.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/\(prodect.img)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        Image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            Image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
