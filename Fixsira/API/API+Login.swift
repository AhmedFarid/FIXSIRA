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
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String?)->Void) {
        
        let apiToken = "123asd"
        let url = URLs.login
        let parameters = [
            "api_token": apiToken,
            "email": email,
            "password": password
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["data"]["user_token"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true, nil)
                }else {
                    let message = json["data"]["message"].string
                    print(message ?? "no")
                        completion(nil, true, message)
                }
                
            }
        }
        
    }
    
    class func loginFB(fb_id: String, email: String, name: String, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String?)->Void) {
        
        let apiToken = "123asd"
        let url = URLs.signupMobileFacebook
        let parameters = [
            "email": email,
            "name": name,
            "api_token": apiToken,
            "fb_id": fb_id
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["data"]["user_token"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true, nil)
                }else {
                    let message = json["data"]["message"].string
                    print(message ?? "no")
                    completion(nil, true, message)
                }
                
            }
        }
        
    }
    
    class func register(carModel: String, car_year: String, fristname: String,lastname: String,phone: String ,email: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let apiToken = "123asd"
        let url = URLs.signUp
        let parameters = [
            "api_token": apiToken,
            "firstName": fristname,
            "lastName": lastname,
            "phone": phone,
            "email": email,
            "password": password,
            "car_year": car_year,
            "car_model": carModel
        ]
        
        print(parameters)
        
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
