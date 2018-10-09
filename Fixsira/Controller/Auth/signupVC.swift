//
//  signupVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class signupVC: UIViewController {

    @IBOutlet weak var frName: palceHolderColor!
    @IBOutlet weak var lsName: palceHolderColor!
    @IBOutlet weak var phone: palceHolderColor!
    @IBOutlet weak var email: palceHolderColor!
    @IBOutlet weak var password: palceHolderColor!
    @IBOutlet weak var passwordComfer: palceHolderColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signupButton(_ sender: Any) {
        guard let frName = frName.text, !frName.isEmpty else {
            self.showAlert(title: "Register Filed", message: "enter first name")
            return
        }
        guard let lsName = lsName.text, !lsName.isEmpty else {
            self.showAlert(title: "Register Filed", message: "enter last name")
            return
        }
        guard let phone = phone.text, !phone.isEmpty else {
            self.showAlert(title: "Register Filed", message: "enter phone")
            return
        }
        guard let email = email.text?.trimmed, !email.isEmpty else {
            self.showAlert(title: "Register Filed", message: "enter email")
            return
        }
        if isValidEmail(testStr: email) == false {
            self.showAlert(title: "Register Filed", message: "email not correct")
        }
        
        guard let password = password.text?.trimmed, !password.isEmpty else {
            self.showAlert(title: "Register Filed", message: "enter password")
            return
        }
        guard let confirmPassword = passwordComfer.text?.trimmed, !confirmPassword.isEmpty else {
            self.showAlert(title: "Register Filed", message: "enter password confirmation")
            return
        }
        
         guard password == confirmPassword else {
            self.showAlert(title: "Register Filed", message: "two password is the same")
            return
        }
        
        API_Login.register(fristname: frName, lastname: lsName, phone: phone, email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                print("success")
            }else {
                self.showAlert(title: "Register Filed", message: "Sorry Try again")
            }
            
        }
        
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
