//
//  pullCarVC3.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class pullCarVC3: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var centerAddress: UILabel!
    
    
    var phone = ""
    var centerAdd = ""
    var centerNa = ""
    var center_Id = ""
    var singelItem: servicesDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("sd\(phone)")
        
        name.text = singelItem?.name
        des.text = singelItem?.descrip
        price.text = singelItem?.price
        let totalRate = NSLocalizedString("Rate This", comment: "totalPebole reated")
        rate.text = "\(singelItem?.rate ?? 0) : \(singelItem?.averageRate ?? 0) \(totalRate)"
        let CenterName = NSLocalizedString("Center Name", comment: "Center Name")
        centerName.text = "\(CenterName): \(centerNa)"
        let CenterAddress = NSLocalizedString("Center Address", comment: "Center Address")
        centerAddress.text = "\(CenterAddress): \(centerAdd)"
        
        image.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/\(singelItem?.img ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL

        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    
    
    @IBAction func resevi(_ sender: Any) {
        guard (helper.getAPIToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "msg list lang")
            self.showAlert(title: "Filed", message: message)
            return
        }
        self.performSegue(withIdentifier: "suge", sender: "pull_washing")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let orderType = segue.destination as? orderServices  {
        orderType.type = sender as! String
        orderType.locationId = center_Id
        orderType.services_id = singelItem?.serviceId ?? ""
       }else if let commennts = segue.destination as? comenntsVc {
        commennts.service_id = center_Id
        commennts.service_type = "pull_washing"
            }
    }
    
    @IBAction func call(_ sender: Any) {
        if let url = URL(string:"tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
