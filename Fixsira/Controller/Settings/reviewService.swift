//
//  reviewService.swift
//  Fixsira
//
//  Created by FARIDO on 10/16/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class reviewService: UIViewController {

    var singleItem: myorders?
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var servicesType: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var prices: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var commentTXT: UITextView!
    
    
    @IBOutlet weak var s1: UIButton!
    @IBOutlet weak var s2: UIButton!
    @IBOutlet weak var s3: UIButton!
    @IBOutlet weak var s4: UIButton!
    @IBOutlet weak var s5: UIButton!
    
    var reate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carName.text = singleItem?.car_name
        servicesType.text = singleItem?.name
        data.text = singleItem?.schedule_date
        prices.text = singleItem?.price
        status.text = singleItem?.status
    }
    
    
    @IBAction func s1b(_ sender: UIButton) {
        sender.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        self.reate = "1"
    }
    
    @IBAction func s2b(_ sender: UIButton) {
        sender.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s1.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        self.reate = "2"
    }
    
    @IBAction func s3b(_ sender: UIButton) {
        sender.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s2.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s1.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        self.reate = "3"
    }
    
    
    @IBAction func s4b(_ sender: UIButton) {
        sender.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s2.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s3.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s1.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        self.reate = "4"
    }
    
    @IBAction func s5b(_ sender: UIButton) {
        sender.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s2.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s3.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s4.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        s1.setImage(UIImage(named: "large-yellow-star"), for: UIControl.State.normal)
        self.reate = "5"
    }
    
    @IBAction func revbtn(_ sender: Any) {
        
        guard let comment = commentTXT.text, !comment.isEmpty else {
            self.showAlert(title: "Review Filed", message: "enter Any comment")
            return
        }
        
        API_review.review(id: singleItem?.vendor_id ?? "", comment: commentTXT.text ?? "ss", rating: reate ) { (error: Error?, success) in
            if success {
                
            }else{
                
            }
            self.showAlert(title: "Thanks For Review", message: "Thanks For Make Our App Batter")
        }
    }
    
}
