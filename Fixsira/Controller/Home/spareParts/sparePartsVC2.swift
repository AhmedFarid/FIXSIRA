//
//  sparePartsVC2.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class sparePartsVC2: UIViewController {
    
    var singelItem: SparParts?
    
    @IBOutlet weak var stokAvaiTXT: UILabel!
    @IBOutlet weak var Detiles: UILabel!
    @IBOutlet weak var priceTXT: UILabel!
    @IBOutlet weak var partnameTXT: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stokAvaiTXT.text = singelItem?.stock_availability
        Detiles.text = singelItem?.content
        priceTXT.text = singelItem?.sale_price
        partnameTXT.text = singelItem?.title
        
        let s = ("http://fixsira.com/site"+(singelItem?.image_url)!)
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
