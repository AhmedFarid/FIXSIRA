//
//  API+Comments.swift
//  Fixsira
//
//  Created by farido on 12/20/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class API_Comments: NSObject {

    class func Days(service_id: String,service_type: String,completion: @escaping (_ error: Error?,_ sparParts: [commets]?)-> Void) {
        let url = URLs.commentServices
        let parameters: [String: Any] = [
            "service_id": service_id,
            "service_type": service_type
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
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [commets]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = commets.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func DaysServices(location_id: String,completion: @escaping (_ error: Error?,_ sparParts: [commets]?)-> Void) {
        let url = URLs.commentProduct
        let parameters: [String: Any] = [
            "product_id": location_id
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
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [commets]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = commets.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}

