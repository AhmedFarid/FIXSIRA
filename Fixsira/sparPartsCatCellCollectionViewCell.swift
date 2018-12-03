//
//  sparPartsCatCellCollectionViewCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/9/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class sparPartsCatCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var catNameTxt: UILabel!


    func configuerCell(prodect: SparPartCat) {
        catNameTxt.text = prodect.name
        image.image = UIImage(named: "placeholder")
        //self.prodectImage.image = placeholde
        //        Alamofire.request("http://fixsira.com/site"+prodect.image_url).response { response in
        //            if let data = response.data, let image = UIImage(data: data) {
        //                self.prodectImage.image = image
        //            }
        //        }
        
        
        let s = ("http://fixsira.com/\(prodect.category_img_url)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
