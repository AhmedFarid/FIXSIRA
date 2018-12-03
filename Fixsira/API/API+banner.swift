//
//  API+banner.swift
//  Fixsira
//
//  Created by AhmedFarid on 11/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//bannerData

import UIKit
import Alamofire
import SwiftyJSON

class API_banner: NSObject {
    
    class func banner (completion: @escaping (_ error: Error?,_ sparParts: [bannerData]?)-> Void) {
        let url = URLs.banner
        
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
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
                var products = [bannerData]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = bannerData.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
