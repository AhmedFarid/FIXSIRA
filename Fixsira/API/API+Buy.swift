//
//  API+Buy.swift
//  Fixsira
//
//  Created by FARIDO on 10/18/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class API_Buy: NSObject {
    
    class func Buying(order_note: String, name: String, company_name: String, email: String, phone: String, fax: String, adddress: String, city: String, postcode: String, completion: @escaping (_ error: Error?, _ success: Bool, _ orderId: Int?)->Void) {
        
        let apiToken = "11"
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        
        let url = URLs.orderShop
        let parameters = [
            "api_token": apiToken,
            "lang": lang,
            "user_token": userToken,
            "order_note": order_note,
            "name": name,
            "company_name": company_name,
            "email": email,
            "phone": phone,
            "fax": fax,
            "adddress": adddress,
            "city": city,
            "postcode": postcode
            ] as [String : Any]
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
                print(json)
                
                if let orderId = json["data"]["order_id"].int {
                    print("orderId\(orderId)")
                    completion(nil, true,orderId)
                }
            }
        }
    }
}
