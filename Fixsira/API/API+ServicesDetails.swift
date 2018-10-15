//
//  API+ServicesDetails.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_ServicesDetails: NSObject {
    
    
    class func servicesDataDetails(type: String, vendor_id: Int, completion: @escaping (_ error: Error?,_ sparParts: [servicesDetails]?)-> Void) {
        let url = URLs.getServices
        let api_token = "11"
        let lang = "ar"
        let user_token = "1111"
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "type": type,
            "vendor_id": vendor_id,
            "user_token": user_token
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
                var products = [servicesDetails]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = servicesDetails.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}

