//
//  loginVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class loginVC: UIViewController {

    @IBOutlet weak var emailTF: palceHolderColor!
    @IBOutlet weak var passwordTF: palceHolderColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginBTN(_ sender: Any) {
        
        guard let email = emailTF.text, !email.isEmpty else {
            self.showAlert(title: "Login Filed", message: "Enter Your Email")
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            self.showAlert(title: "Login Filed", message: "Enter Your Password")
            return
        }
        
        API_Login.login(email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                self.showAlert(title: "Login Filed", message: "Sorry Try again and check your Email or Password")
            }else{
                self.showAlert(title: "Login Filed", message: "Sorry Try again and check your connection ")
            }
        }
    }
}
