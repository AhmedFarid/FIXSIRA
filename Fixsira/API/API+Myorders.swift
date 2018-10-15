//
//  API+Myorders.swift
//  Fixsira
//
//  Created by FARIDO on 10/15/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Myorders: NSObject {
    
    class func myOrders(completion: @escaping (_ error: Error?,_ sparParts: [myorders]?)-> Void) {
        let url = URLs.myOrderServices
        let api_token = "11"
        let lang = "ar"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil)
            return
        }
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "user_token": userToken
        ]
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [myorders]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myorders.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
