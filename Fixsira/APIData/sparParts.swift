//
//  sparParts.swift
//  Fixsira
//
//  Created by FARIDO on 10/7/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON


class SparParts: NSObject {
    
    var id: String
    var author_id: String
    var content: String
    var title: String
    var slug: String
    var status: String
    var sku: String
    var regular_price: String
    var sale_price: String
    var price: String
    var stock_qty: String
    var stock_availability: String
    var type: String
    var image_url: String
    var created_at: String
    var updated_at: String
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string, let author_id = dict["author_id"]?.string, let content = dict["content"]?.string, let title = dict["title"]?.string, let slug = dict["slug"]?.string, let status = dict["status"]?.string, let sku = dict["sku"]?.string, let regular_price = dict["regular_price"]?.string, let sale_price = dict["sale_price"]?.string, let price = dict["price"]?.string, let stock_qty = dict["stock_qty"]?.string, let stock_availability = dict["stock_availability"]?.string, let type = dict["type"]?.string, let image_url = dict["image_url"]?.string, let created_at = dict["created_at"]?.string, let updated_at = dict["updated_at"]?.string else {return nil}
        
        
        self.id = id
        self.author_id = author_id
        self.content = content
        self.title = title
        self.slug = slug
        self.status = status
        self.sku = sku
        self.regular_price = regular_price
        self.sale_price = sale_price
        self.price = price
        self.stock_qty = stock_qty
        self.stock_availability = stock_availability
        self.type = type
        self.image_url = image_url
        self.created_at = created_at
        self.updated_at = updated_at
        
    }
    
    class SparPartCat: NSObject {
    }
    
}


