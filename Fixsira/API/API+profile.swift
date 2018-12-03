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
    
    class func profile(completion: @escaping (_ error: Error?, _ success: Bool, _ name: String?,_ email: String?)->Void) {
        
        let apiToken = "11"
        let lang = "en"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil,nil)
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
                completion(error, false, nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                if let name = json["data"]["display_name"].string {
                    print("orderId\(name)")
                    if let email = json["data"]["email"].string {
                    print("orderId\(email)")
                    completion(nil, true,name,email)
                    }
                }
                
            }
        }
    }
}
