//
//  carWishingVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class carWishingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    
    var services = [Services]()
    var carmodelId = 0
    var typeId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
        handleRefresh()
    }
    
    
    @objc private func handleRefresh() {
        API_Services.servicesData(car_model_id: carmodelId, type_id: typeId, type: "car_washing"){ (error: Error?, services: [Services]?) in
            if let services = services {
                self.services = services
                print("xxx\(self.services)")
                self.tabelView.reloadData()
            }
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? carWishingCell {
            let cells = services[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else {
            return carWishingCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: services[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? carWishingVC2{
            distantion.carmodelId = carmodelId
            distantion.typeId = typeId
            if let prodacet = sender as? Services {
                distantion.singelItem = prodacet
            }
        }
    }
}
