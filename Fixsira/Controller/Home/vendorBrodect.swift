//
//  vendorBrodect.swift
//  Fixsira
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class vendorBrodect: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabelViewdata: UITableView!
    
    var sparparts = [SparParts]()
    var vendorId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabelViewdata.delegate = self
        tabelViewdata.dataSource = self
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API.productsList(vendor_Id: vendorId, cat_id: "", srch_term: "") { (error: Error?, sparparts: [SparParts]?, last_page: Int) in
            if let sparparts = sparparts {
                self.sparparts = sparparts
                print("xxx\(self.sparparts)")
                self.tabelViewdata.reloadData()
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sparparts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelViewdata.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? prodectVendor {
            let cells = sparparts[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
            return prodectVendor()
        }
    }
    
    
}
