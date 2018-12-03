//
//  API+review.swift
//  Fixsira
//
//  Created by FARIDO on 10/16/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_review: NSObject {

    class func review(id: String, comment: String, rating: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let apiToken = "11"
        let lang = "en"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false)
            return
        }
        
        let url = URLs.reviewVendor
        let parameters = [
            "api_token": apiToken,
            "lang": lang,
            "user_token": userToken,
            "comment": comment,
            "vendor_id": id,
            "rating": rating
            ] as [String : Any]
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
                print(json)
                completion(nil, true)
            }
        }
    }
}
