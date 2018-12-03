//
//  API+Cart.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Cart: NSObject {
    
    class func addToCart(vendor_id: String ,products_id: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let apiToken = "11"
        let lang = "en"
        let quantity = "1"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false)
            return
        }
        
        let url = URLs.addToCart
        let parameters = [
            "api_token": apiToken,
            "lang": lang,
            "quantity": quantity,
            "products_id": products_id,
            "vendor_id": vendor_id,
            "user_token": userToken
        ]
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
                
            }
        }
    }
    
    class func deleteFromCart(products_id: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let apiToken = "11"
        let lang = "en"
        let quantity = "1"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false)
            return
        }
        
        let url = URLs.deleteFromCart
        let parameters = [
            "api_token": apiToken,
            "lang": lang,
            "quantity": quantity,
            "products_id": products_id,
            "user_token": userToken
        ]
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
                
            }
        }
    }
    class func showcart(completion: @escaping (_ error: Error?,_ sparParts: [cartData]?, _ priceVA: Int?)-> Void) {
        let url = URLs.showCart
        let api_token = "11"
        let lang = "en"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil, nil)
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
                completion(error, nil, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"]["products"].array else{
                    completion(nil, nil,nil)
                    return
                }
                print(dataArray)
                var products = [cartData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = cartData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,nil)
                if let totalPrice = json["data"]["total_price"].int {
                    print("totlaPrice\(totalPrice)")
                    completion(nil, products,totalPrice)
                }
            }
        }
    }
    
    
    class func getPrice(completion: @escaping (_ error: Error?, _ priceVA: Int?)-> Void) {
        
        let url = URLs.showCart
        let api_token = "11"
        let lang = "en"
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil)
            return
        }
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "user_token": userToken
        ]
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error, nil)
                    print("error  \(error)")
                case .success(let value):
                    print(value)
                    let result = value as! [String:AnyObject]
                    if let status = result["status"] as? Int {
                        switch status {
                        case 1:
                            if let data = result["data"] as? [String:AnyObject] {
                                let message = data["message"] as? String ?? ""
                                print(message)
                                let price = data["price"] as? Int ?? 0
                                completion(nil, price)
                                print("aa \(price)")
                            }
                        case 0:
                            print("faluire")
                        default:
                            break
                        }
                    }
                }
        }
    }
}
