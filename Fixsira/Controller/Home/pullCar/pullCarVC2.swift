//
//  pullCarVC2.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class pullCarVC2: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!
    var singelItem: Services?
    var serviceDeatils = [servicesDetails]()
    
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phone = singelItem?.phone ?? ""
        print("ssss\(self.phone)")
        tableView.delegate = self
        tableView.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_ServicesDetails.servicesDataDetails(type: "pull_washing", vendor_id: singelItem?.id ?? 1){ (error: Error?, serviceDeatils: [servicesDetails]?) in
            if let serviceDeatils = serviceDeatils {
                self.serviceDeatils = serviceDeatils
                print("xxx\(self.serviceDeatils)")
                self.tableView.reloadData()
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? pullCarDetilesCell {
            let cells = serviceDeatils[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
            return pullCarDetilesCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: serviceDeatils[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? pullCarVC3{
            if let prodacet = sender as? servicesDetails {
                distantion.singelItem = prodacet
                distantion.phone = phone
            }
        }
    }
}
