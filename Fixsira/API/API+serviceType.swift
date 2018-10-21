//
//  API+serviceType.swift
//  Fixsira
//
//  Created by FARIDO on 10/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_serviceType: NSObject {
    
    class func carModle(completion: @escaping (_ error: Error?,_ sparParts: [servicesType]?)-> Void) {
        let url = URLs.carModelList
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
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"]["car_model"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [servicesType]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = servicesType.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
