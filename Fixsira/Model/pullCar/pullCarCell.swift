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
    @IBOutlet weak var distance: UILabel!
    
    
    func configuerCell(prodect: PullCar) {
        
        vrndorName.text = prodect.centerName
        name.text = prodect.pullName
        address.text = prodect.centerAddress
        let totalRate = NSLocalizedString("Rate This", comment: "totalPebole reated")
        rateAvg.text = "\(prodect.rating) \(totalRate)"
        //telephone.text = prodect.telephone
        reate.text = "\(prodect.total)"
        
        wishImage.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/\(prodect.pullImage)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        wishImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            wishImage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
