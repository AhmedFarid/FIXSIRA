//
//  pullcarVc.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class pullcarVc: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabelView: UITableView!
    var services = [Services]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
        handleRefresh()
    }
    
    
    @objc private func handleRefresh() {
        API_Services.servicesData(type: "pull_washing"){ (error: Error?, services: [Services]?) in
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
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? pullCarCell {
            let cells = services[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else {
            return pullCarCell()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: services[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? pullCarVC2{
            if let prodacet = sender as? Services {
                distantion.singelItem = prodacet
            }
        }
    }
}



