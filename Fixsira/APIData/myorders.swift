//
//  myorders.swift
//  Fixsira
//
//  Created by FARIDO on 10/15/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

//"id": 41,
//"user_id": "59",
//"vendor_id": "14",
//"services_type": "car_pull",
//"car_name": "000",
//"car_model": "000",
//"car_model_year": "000",
//"name": "car pull",
//"description": "car accessories",
//"price": "507",
//"img": "/public/uploads/1539520093-h-100-عشان تطول عمر الفرامل في عربيتك copy.png",
//"lng": "-122.0312186",
//"lat": "37.33233141",
//"schedule_date": "2018-10-16 19:16:10",
//"status": "pending",
//"date_added": "2018-10-15 17:16:25"
//}
//],

class myorders: NSObject {
    
    var id: Int
    var user_id: String
    var vendor_id: String
    var services_type: String
    var car_name: String
    var car_model: String
    var car_model_year: String
    var name: String
    var descri: String
    var price: String
    var img: String
    var lng: String
    var lat: String
    var schedule_date: String
    var status: String
    var date_added: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let user_id = dict["user_id"]?.string,let vendor_id = dict["vendor_id"]?.string, let services_type = dict["services_type"]?.string, let car_name = dict["car_name"]?.string,let car_model = dict["car_model"]?.string,let car_model_year = dict["car_model_year"]?.string,let name = dict["name"]?.string,let descri = dict["description"]?.string,let price = dict["price"]?.string, let img = dict["img"]?.string,let lng = dict["lng"]?.string,let lat = dict["lat"]?.string,let schedule_date = dict["schedule_date"]?.string, let status = dict["status"]?.string, let date_added = dict["date_added"]?.string else {return nil}
        
        self.id = id
        self.user_id = user_id
        self.vendor_id = vendor_id
        self.services_type = services_type
        self.car_name = car_name
        self.car_model = car_model
        self.car_model_year = car_model_year
        self.name = name
        self.descri = descri
        self.price = price
        self.img = img
        self.lng = lng
        self.lat = lat
        self.schedule_date = schedule_date
        self.status = status
        self.date_added = date_added
    }
}

class myordersProdect: NSObject {
    
    var id: Int
    var _order_date: String
    var _order_currency: String
    var _order_total: String
    var _final_order_total: String
    var _order_status: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let _order_date = dict["_order_date"]?.string,let _order_currency = dict["_order_currency"]?.string, let _order_total = dict["_order_total"]?.string, let _final_order_total = dict["_final_order_total"]?.string,let _order_status = dict["_order_status"]?.string else {return nil}
        
        self.id = id
        self._order_date = _order_date
        self._order_currency = _order_currency
        self._order_total = _order_total
        self._final_order_total = _final_order_total
        self._order_status = _order_status
    }
}

class myordersProdectDetels: NSObject {
    
    var id: Int
    var products_id: String
    var name: String
    var quantity: String
    var price: String
    var order_price: String
    var img_src: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let products_id = dict["products_id"]?.string,let name = dict["name"]?.string, let quantity = dict["quantity"]?.string, let price = dict["price"]?.string,let order_price = dict["order_price"]?.string, let img_src = dict["img_src"]?.string else {return nil}
        
        self.id = id
        self.products_id = products_id
        self.name = name
        self.quantity = quantity
        self.price = price
        self.order_price = order_price
        self.img_src = img_src
        
    }
}
