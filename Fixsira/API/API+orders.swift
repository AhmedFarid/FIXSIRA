//
//  API+orders.swift
//  Fixsira
//
//  Created by FARIDO on 10/15/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_orders: NSObject {
    
    class func orderService(services_id: Int, services_Type: String, lat: Double, long: Double, phone: String, car_name: String, car_model: String, car_model_year: String, date: String, completion: @escaping (_ error: Error?, _ success: Bool, _ orderId: Int?)->Void) {
        
        let apiToken = "11"
        let lang = "ar"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil)
            return
        }
        
        let url = URLs.orderServices
        let parameters = [
            "api_token": apiToken,
            "lang": lang,
            "user_token": userToken,
            "services_id": services_id,
            "services_type": services_Type,
            "lat": lat,
            "lng": long,
            "phone": phone,
            "car_name": car_name,
            "car_model": car_model,
            "car_model_year": car_model_year,
            "schedule_date": date
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
