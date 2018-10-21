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
    var serviceDeatils = [servicesDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
         handleRefresh()
    }
    @objc private func handleRefresh() {
        API_ServicesDetails.servicesDataDetails(type: "car_maintenance", vendor_id: singelItem?.id ?? 1){ (error: Error?, serviceDeatils: [servicesDetails]?) in
            if let serviceDeatils = serviceDeatils {
                self.serviceDeatils = serviceDeatils
                print("xxx\(self.serviceDeatils)")
                self.tableview.reloadData()
            }
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceDeatils.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? carMintDetCell {
            let cells = serviceDeatils[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
            return carMintDetCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: serviceDeatils[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? carMaintVC3{
            if let prodacet = sender as? servicesDetails {
                distantion.singelItem = prodacet
            }
        }
    }
}
