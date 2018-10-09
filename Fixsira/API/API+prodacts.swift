//
//  API+prodacts.swift
//  Fixsira
//
//  Created by FARIDO on 10/7/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//n

import Foundation
import Alamofire
import SwiftyJSON


class API: NSObject {
    class func productsList(cat_id: String ,srch_term: String, page: Int = 1, completion: @escaping (_ error: Error?,_ sparParts: [SparParts]?, _ last_page: Int)-> Void) {
        let url = URLs.productsList
        let api_token = "11"
        let lang = "ar"
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "page": page,
            "srch_term":srch_term,
            "cat_id":cat_id
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil, page)
                print(error)
                
            case .success(let value):
                //print(value)
                let json = JSON(value)
                guard let dataArray = json["data"]["products"]["data"].array else{
                    completion(nil, nil, page)
                    return
                }
                print(dataArray)
                var products = [SparParts]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = SparParts.init(dict: data){
                        products.append(prodect)
                    }
                }
                let last_page = json["data"]["products"]["last_page"].int ?? page
                completion(nil, products, last_page)
            }
        }
    }
    
    class func productsListCat(page: Int = 1, completion: @escaping (_ error: Error?,_ sparParts: [SparPartCat]?, _ last_page: Int)-> Void) {
        let url = URLs.categoryList
        let api_token = "11"
        let lang = "ar"
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lang": lang,
            "page": page
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil, page)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil, page)
                    return
                }
                print(dataArray)
                var products = [SparPartCat]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = SparPartCat.init(dict: data){
                        products.append(prodect)
                    }
                }
                let last_page = json["data"]["products"]["last_page"].int ?? page
                completion(nil, products, last_page)
            }
        }
    }
}
