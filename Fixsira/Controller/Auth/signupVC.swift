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
    @IBOutlet weak var carYear: palceHolderColor!
    @IBOutlet weak var carModel: palceHolderColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signupButton(_ sender: Any) {
        
        guard let carYear = carYear.text, !carYear.isEmpty else {
            let messages = NSLocalizedString("enter car Year", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let carModel = carModel.text, !carModel.isEmpty else {
            let messages = NSLocalizedString("enter car Model", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let frName = frName.text, !frName.isEmpty else {
            let messages = NSLocalizedString("enter first name", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        guard let lsName = lsName.text, !lsName.isEmpty else {
            let messages = NSLocalizedString("enter last name", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        guard let phone = phone.text, !phone.isEmpty else {
            let messages = NSLocalizedString("enter phone", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        guard let email = email.text?.trimmed, !email.isEmpty else {
            let messages = NSLocalizedString("enter email", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        if isValidEmail(testStr: email) == false {
            let messages = NSLocalizedString("email not correct", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
        }
        
        guard let password = password.text?.trimmed, !password.isEmpty else {
            let messages = NSLocalizedString("enter password", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        guard let confirmPassword = passwordComfer.text?.trimmed, !confirmPassword.isEmpty else {
            let messages = NSLocalizedString("enter password confirmation", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
         guard password == confirmPassword else {
            let messages = NSLocalizedString("two password is not the same", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        API_Login.register(carModel: carModel, car_year: carYear, fristname: frName, lastname: lsName, phone: phone, email: email, password: password) { (error: Error?, success: Bool) in
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
