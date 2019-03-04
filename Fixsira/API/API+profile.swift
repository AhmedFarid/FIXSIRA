//
//  API+profile.swift
//  Fixsira
//
//  Created by FARIDO on 10/15/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_profile: NSObject {
    
    class func profile(completion: @escaping (_ error: Error?, _ success: Bool, _ name: String?,_ email: String?, _ phone: String?, _ carModle: String?, _ carYear: String?)->Void) {
        
        let apiToken = "11"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil,nil,nil,nil,nil)
            return
        }
        
        let url = URLs.profile
        let parameters = [
            "api_token": apiToken,
            "lang": lang,
            "user_token": userToken,
            ] as [String : Any]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                if let name = json["data"]["display_name"].string {
                    print("orderId\(name)")
                    if let email = json["data"]["email"].string {
                        if let phone = json["data"]["phone"].string {
                            if let carModel = json["data"]["carModel"].string {
                                if let carYear = json["data"]["carYear"].string {
                    print("orderId\(email)")
                    completion(nil, true,name,email,phone,carModel,carYear)
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    class func orderService(old_password: String, new_password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String?)->Void) {
        
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        
        let url = URLs.changPassword
        let parameters = [
            "user_token": userToken,
            "old_password": old_password,
            "new_password": new_password
            ] as [String : Any]
        
        print(parameters)
        print(url)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                    if let meessage = json["data"]["message"].string{
                            completion(nil, true,meessage)
                }
            }
        }
    }
    
    class func editProfile(car_year: String, car_model: String,phone: String, name: String, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String?)->Void) {
        
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        
        let url = URLs.updateProfile
        let parameters = [
            "user_token": userToken,
            "name": name,
            "car_model": car_model,
            "car_year": car_year,
            "phone": phone
            ] as [String : Any]
        
        print(parameters)
        print(url)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                if let meessage = json["data"]["message"].string{
                    completion(nil, true,meessage)
                }else {
                    let meessage = json["data"].string
                        completion(nil, true,meessage)
                }
            }
        }
    }
}
