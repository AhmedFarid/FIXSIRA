//
//  changePasswordVC.swift
//  Fixsira
//
//  Created by farido on 12/16/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class changePasswordVC: UIViewController {

    @IBOutlet weak var oldTF: UITextField!
    @IBOutlet weak var newTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeBTN(_ sender: Any) {
        
        API_profile.orderService(old_password: oldTF.text ?? "", new_password: newTF.text ?? "") { (error: Error?, success,message) in
            let ChangePassword = NSLocalizedString("Change Password", comment: "Change Password")
            self.showAlert(title: "\(ChangePassword)" , message: message ?? "")
        }
        
    }
}
