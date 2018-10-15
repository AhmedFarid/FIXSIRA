//
//  settingsVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class settingsVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    
    
    
    var orders = [myorders]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_Myorders.myOrders{ (error: Error?, orders: [myorders]?) in
            if let orders = orders {
                self.orders = orders
                print("xxx\(self.orders)")
                self.tableview.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myordersCell {
        let cells = orders[indexPath.row]
        cell.configuerCell(prodect: cells)
        return cell
        }else {
         return myordersCell()
        }
    }
}
