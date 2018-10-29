//
//  carWishingVC2.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class carWishingVC2: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var singelItem: Services?
    var vendorProfiles = [vendorProfile]()
    
    var carmodelId = 0
    var typeId = 0
    var locationId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        locationId = singelItem?.id ?? 0
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_VendorProfile.servicesTypes(location_id:singelItem?.id ?? 0){ (error: Error?, vendorProfiles: [vendorProfile]?) in
            if let vendorProfiles = vendorProfiles {
                self.vendorProfiles = vendorProfiles
                print("xxx\(self.vendorProfiles)")
                self.tableView.reloadData()
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? carMaintDetailsCell {
            let cells = vendorProfiles[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
           return carMaintDetailsCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: vendorProfiles[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? carWishingVC3{
            if let prodacet = sender as? vendorProfile {
                distantion.singelItems = prodacet
                distantion.ima = singelItem?.user_photo_url ?? ""
                distantion.rates = "\(singelItem?.rate_total ?? 0)"
                distantion.carmodelId = carmodelId
                distantion.typeId = typeId
                distantion.locationId = locationId
                distantion.vendorID = prodacet.id
                distantion.prices = singelItem?.price ?? ""
            }
        }
    }
}
