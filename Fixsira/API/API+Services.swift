//
//  API+Services.swift
//  Fixsira
//
//  Created by FARIDO on 10/11/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//Services PullCar

import UIKit
import Alamofire
import SwiftyJSON

class API_Services: NSObject {
    
    class func servicesData(car_model_id: Int,type_id: String ,type: String,type_vist: String, completion: @escaping (_ error: Error?,_ sparParts: [Services]?)-> Void) {
        let url = URLs.locationList
        let api_token = "11"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "type": type,
            "type_id": type_id,
            "car_model_id": car_model_id,
            "type_vist": type_vist
        ]
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                //print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print("cc\(dataArray)")
                var products = [Services]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = Services.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func pullCarData(car_model_id: Int,type_id: String ,type: String,type_vist: String, completion: @escaping (_ error: Error?,_ sparParts: [PullCar]?)-> Void) {
        let url = URLs.locationList
        let api_token = "11"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "type": type,
            "type_id": type_id,
            "car_model_id": car_model_id,
            "type_vist": type_vist
        ]
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                //print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print("cc\(dataArray)")
                var products = [PullCar]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = PullCar.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
