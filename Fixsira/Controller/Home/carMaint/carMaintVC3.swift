//
//  carMaintVC3.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class carMaintVC3: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    var singelItem: servicesDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = singelItem?.name
        des.text = singelItem?.descrip
        price.text = singelItem?.price
        rate.text = singelItem?.rate
        
        image.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/site\(singelItem?.img ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    
    @IBAction func resevi(_ sender: Any) {
        self.performSegue(withIdentifier: "suge", sender: "car_maintenance")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let orderType = segue.destination as? orderServices else { return }
        orderType.type = sender as! String
        orderType.services_id = singelItem?.id ?? 0
    }
    
    @IBAction func phoneCall(_ sender: Any) {
    }
    
    
}
