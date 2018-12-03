//
//  galryCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/10/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class galryCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func configuerCell(prodect: SparPartGalrys) {
        image.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/\(prodect.url)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
