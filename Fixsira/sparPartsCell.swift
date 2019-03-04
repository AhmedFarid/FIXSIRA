//
//  sparPartsCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/8/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


class sparPartsCell: UICollectionViewCell {
    
    @IBOutlet weak var prodectImage: UIImageView!
    @IBOutlet weak var prodectName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var Discount: UILabel!
    @IBOutlet weak var inStoke: UILabel!
    @IBOutlet weak var rateAvg: UILabel!
    @IBOutlet weak var instoke: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var totalrate: UILabel!
    
    
    func configuerCell(prodect: SparParts) {
        let totalRate = NSLocalizedString("Rate This", comment: "totalPebole reated")
        totalrate.text = "\(prodect.rate_average) \(totalRate)"
        rate.text = "\(prodect.rate_total)"
        instoke.text = prodect.stock_availability
        prodectName.text = prodect.title
        let discount = NSLocalizedString("Discount", comment: "discount")
        Discount.text = "\(discount): \(prodect.sale_price)"
        let Price = NSLocalizedString("Price", comment: "Price")
        price.text = "\(Price): \(prodect.regular_price)"
        prodectImage.image = UIImage(named: "placeholder")
        //self.prodectImage.image = placeholde
//        Alamofire.request("http://fixsira.com/site"+prodect.image_url).response { response in
//            if let data = response.data, let image = UIImage(data: data) {
//                self.prodectImage.image = image
//            }
//        }
        
        
        let s = ("http://fixsira.com/\(prodect.image_url)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        prodectImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            prodectImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}

