//
//  vendorBrodect.swift
//  Fixsira
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class vendorBrodect: UIViewController {

    var sparparts = [SparParts]()
    var vendorId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API.productsList(vendor_Id: vendorId, cat_id: "", srch_term: "") { (error: Error?, sparparts: [SparParts]?, last_page: Int) in
            if let sparparts = sparparts {
                self.sparparts = sparparts
                print("xxx\(self.sparparts)")
                //self.collection.reloadData()
            }
        }
        
    }
}
