//
//  editProfile.swift
//  Fixsira
//
//  Created by farido on 12/18/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class editProfile: UIViewController {

    
    
    @IBOutlet weak var carYear: UITextField!
    @IBOutlet weak var carModle: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var name: UITextField!
    
    
    var names = ""
    var phones = ""
    var carYears = ""
    var carModels = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = names
        phone.text = phones
        carModle.text = carModels
        carYear.text = carYears
        
        
        
    }
    
    

    @IBAction func changeBTN(_ sender: Any) {
        API_profile.editProfile(car_year: carYear.text ?? "", car_model: carModle.text ?? "", phone: phone.text ?? "", name: name.text ?? "") { (error: Error?, success,message) in
            let EditProfile = NSLocalizedString("Edit Profile", comment: "Edit Profile")
            self.showAlert(title: "\(EditProfile)" , message: message ?? "")
        }
        
    }
}
