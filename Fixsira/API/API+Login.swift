//
//  API+Login.swift
//  Fixsira
//
//  Created by FARIDO on 10/7/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Login: NSObject {
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let apiToken = "123asd"
        let url = URLs.login
        let parameters = [
            "api_token": apiToken,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["data"]["user_token"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true)
                }
                
            }
        }
        
    }
    
    class func register(fristname: String,lastname: String,phone: String ,email: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let apiToken = "123asd"
        let url = URLs.signUp
        let parameters = [
            "api_token": apiToken,
            "firstName": fristname,
            "lastName": lastname,
            "phone": phone,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["data"]["user_token"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true)
                }
                
            }
        }
        
    }
    

}
