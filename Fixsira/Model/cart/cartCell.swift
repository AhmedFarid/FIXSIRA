//
//  cartCell.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class cartCell: UITableViewCell {

    @IBOutlet weak var prodectPrice: UILabel!
    @IBOutlet weak var partImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    //@IBOutlet weak var content: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    //var cart: cartData?
    var addAction: (() -> Void)?
    var deleteAction: (() -> Void)?
    
    func configuerCell(prodect: cartData) {
        prodectPrice.text = prodect.sale_price
        title.text = prodect.title
        //content.text = prodect.content
        price.text = prodect.final_price
        quantity.text = prodect.quantity
        
        partImage.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/site\(prodect.image_url)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        partImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            partImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    @IBAction func add(_ sender: Any) {
        addAction?()
    }
    
    @IBAction func delet(_ sender: Any) {
        deleteAction?()
    }
}
