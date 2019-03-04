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
import FBSDKCoreKit
import FBSDKLoginKit

class loginVC: UIViewController {

    @IBOutlet weak var emailTF: palceHolderColor!
    @IBOutlet weak var passwordTF: palceHolderColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @IBAction func fbLoginBTN(_ sender: Any) {
        let fbdLoginManager: FBSDKLoginManager = FBSDKLoginManager()
        fbdLoginManager.logIn(withReadPermissions: ["email"], from: self){ (result,error) in
            if (error == nil) {
                let fbLoginResult: FBSDKLoginManagerLoginResult = result!
                if fbLoginResult.grantedPermissions != nil {
                    if(fbLoginResult.grantedPermissions.contains("email")) {
                            self.GetFBUserData()
                        fbdLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    func loginButtonDidLogout(_ loginButoon: FBSDKLoginButton!) {
        print("user Logout")
    }
    
    func GetFBUserData() {
        if((FBSDKAccessToken.current()) != nil) {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, name, first_name, last_name, picture.type(large), email"])?.start(completionHandler:{(connection, result, error)-> Void in
                if (error == nil) {
                    let faceDic = result as! [String: AnyObject]
                    print(faceDic)
                    let email = faceDic["email"] as! String
                    print(email)
                    let id = faceDic["id"] as! String
                    print(id)
                    let fname = faceDic["first_name"] as! String
                    print(fname)
                    let lname = faceDic["last_name"] as! String
                    if id != "" {
                        
                        API_Login.loginFB(fb_id: id, email: email, name: "\(fname) \(lname)"){ (error: Error?, success: Bool, message) in
                            if success {
                                let messages = NSLocalizedString("please check your email or password", comment: "hhhh")
                                let title = NSLocalizedString("Login Filed", comment: "hhhh")
                                self.showAlert(title: title, message: "\(message ?? "") \(messages)")
                            }else{
                            }
                        }
                    }
                }
            })
        }
    }
    
    

    @IBAction func loginBTN(_ sender: Any) {
        
        guard let email = emailTF.text, !email.isEmpty else {
            let message = NSLocalizedString("Enter Your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            let message = NSLocalizedString("Enter Your Password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
        }
        
        API_Login.login(email: email, password: password) { (error: Error?, success: Bool, message) in
            if success {
                let messages = NSLocalizedString("please check your email or password", comment: "hhhh")
                let title = NSLocalizedString("Login Filed", comment: "hhhh")
                self.showAlert(title: title, message: "\(message ?? "") \(messages)")
            }else{
                let messages = NSLocalizedString("please check your email or password", comment: "hhhh")
                let title = NSLocalizedString("Login Filed", comment: "hhhh")
                self.showAlert(title: title, message: "\(message ?? "") \(messages)")
            }
            
            let messages = NSLocalizedString("please check your email or password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: "\(message ?? "") \(messages)")
        }
    }
}
