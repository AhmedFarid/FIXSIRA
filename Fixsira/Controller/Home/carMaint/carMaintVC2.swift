//
//  carMaintVC2.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class carMaintVC2: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableview: UITableView!
    
    var singelItem: Services?
    var vendorProfiles = [vendorProfile]()
    
    var carmodelId = 0
    var typeId = ""
    var locationId = ""
    var price = 0
    var typeFix = ""
    var services_id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        locationId = singelItem?.vendorId ?? ""
        
         handleRefresh()
    }
    @objc private func handleRefresh() {
        API_VendorProfile.servicesTypes(location_id:singelItem?.centerId ?? ""){ (error: Error?, vendorProfiles: [vendorProfile]?) in
            if let vendorProfiles = vendorProfiles {
                self.vendorProfiles = vendorProfiles
                print("xxx\(self.vendorProfiles)")
                self.tableview.reloadData()
            }
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vendorProfiles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? carMintDetCell {
            let cells = vendorProfiles[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
            return carMintDetCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: vendorProfiles[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? carMaintVC3{
            if let prodacet = sender as? vendorProfile {
                distantion.singelItems = prodacet
                distantion.ima = singelItem?.image ?? ""
                distantion.rates = "\(singelItem?.total ?? 0)"
                distantion.carmodelId = carmodelId
                distantion.typeId = typeId
                distantion.locationId = singelItem?.centerId ?? ""
                distantion.vendorID = prodacet.id
                if typeFix == "On Site"{
                    distantion.prices = singelItem?.price ?? ""
                }else{
                    distantion.prices = singelItem?.totalPrice ?? ""
                }
                distantion.typeFix = typeFix
                distantion.services_id = singelItem?.servicesId ?? ""
            }
        }
    }
}
