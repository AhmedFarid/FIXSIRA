//
//  cartData.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class cartData: NSObject {
    
    
    var id: Int
    var user_id: String
    var products_id: String
    var quantity: String
    var unit_price: String
    var final_price: String
    var date_added: String
    var is_order: String
    var created_at: String
    var updated_at: String
    var content: String
    var vendor_name: String
    var title: String
    var sale_price: String
    var image_url: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.int, let user_id = dict["user_id"]?.string, let products_id = dict["products_id"]?.string, let quantity = dict["quantity"]?.string, let unit_price = dict["unit_price"]?.string, let final_price = dict["final_price"]?.string, let date_added = dict["date_added"]?.string, let is_order = dict["is_order"]?.string, let created_at = dict["created_at"]?.string, let updated_at = dict["updated_at"]?.string, let content = dict["content"]?.string, let vendor_name = dict["vendor_name"]?.string, let title = dict["title"]?.string, let sale_price = dict["sale_price"]?.string, let image_url = dict["image_url"]?.string else {return nil}
        
        self.id = id
        self.user_id = user_id
        self.products_id = products_id
        self.quantity = quantity
        self.unit_price = unit_price
        self.final_price = final_price
        self.date_added = date_added
        self.is_order = is_order
        self.created_at = created_at
        self.updated_at = updated_at
        self.content = content
        self.vendor_name = vendor_name
        self.title = title
        self.sale_price = sale_price
        self.image_url = image_url
    }
}

