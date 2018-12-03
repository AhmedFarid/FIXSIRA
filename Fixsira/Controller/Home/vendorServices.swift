//
//  vendorServices.swift
//  Fixsira
//
//  Created by FARIDO on 10/28/18.®
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class vendorServices: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    
    var vendorId = ""
    var servicesDetail = [servicesDetails]()
    var type = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hhh\(vendorId)")
        print("hhhh")
        tabelView.delegate = self
        tabelView.dataSource = self
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_ServicesDetails.servicesDataDetails(type: type, vendor_id: vendorId){ (error: Error?, servicesDetail: [servicesDetails]?) in
            if let servicesDetail = servicesDetail {
                self.servicesDetail = servicesDetail
                print("xxx\(self.servicesDetail)")
                self.tabelView.reloadData()
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicesDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? servicesVendor {
            let cells = servicesDetail[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
            return servicesVendor()
        }
    }
    

}
