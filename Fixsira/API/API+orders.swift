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
    
    class func orderService(type_services: String,services_id: String,type_id: String,car_model_id: Int, location_id: String, services_Type: String, lat: Double, long: Double, phone: String, car_name: String, car_model: String, car_model_year: String, date: String, completion: @escaping (_ error: Error?, _ success: Bool, _ orderId: Int?, _ message: String?,_ orderPrice: Int? )->Void) {
        
        let apiToken = "11"
        let lang = "en"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil,nil,nil)
            return
        }
        
        let url = URLs.orderServices
        let parameters = [
            "car_model_year": car_model_year,
            "type_services": type_services,
            "phone": phone,
            "location_id": location_id,
            "api_token": apiToken,
            "lng": long,
            "user_token": userToken,
            "car_name": car_name,
            "schedule_date": date,
            "lang": lang,
            "services_type": services_Type,
            "car_model_id": car_model_id,
            "car_model":car_model ,
            "type_id": type_id,
            "lat":lat,
            "services_id": services_id
            ] as [String : Any]
        print(parameters)
        print(url)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                if let orderId = json["data"]["order_id"].int {
                    if let meessage = json["data"]["message"].string{
                        if let ordarPrice = json["data"]["orderPrice"].int {
                    print("orderId\(orderId)")
                            print("\(meessage)")
                    completion(nil, true,orderId,meessage,ordarPrice)
                        }
                    }
                }
            }
        }
    }
}
