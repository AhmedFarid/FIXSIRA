//
//  API+servicesTypecar.swift
//  Fixsira
//
//  Created by FARIDO on 10/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_servicesTypecar: NSObject {

    class func servicesTypes(type: String,completion: @escaping (_ error: Error?,_ sparParts: [servicestypes]?)-> Void) {
        let url = URLs.servicesType
        let api_token = "11"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
//        guard let userToken = helper.getAPIToken() else {
//            completion(nil,nil)
//            return
//        }
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            //"user_token": userToken,
            "type": type
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
                guard let dataArray = json["data"]["services_type"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [servicestypes]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = servicestypes.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
