//
//  myProdectOrderVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/19/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class myProdectOrderVC: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    
    var orders = [myordersProdect]()
    var id = 0
    var order_currency = ""
    var orderTotla = ""
    var orderDate = ""
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_Myorders.myOrderProdects{ (error: Error?, orders: [myordersProdect]?) in
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
        if let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myProdectOrderCell {
            let cells = orders[indexPath.row]
            cell.configuerCell(prodect: cells)
            
            cell.reviewBTN = {
                self.id = cells.id
                self.order_currency = cells._order_currency
                self.orderDate = cells._order_date
                self.orderTotla = cells._order_total
                if cells._order_status == "on-hold"{
                    //print("no")
                    
                }else {
                    self.performSegue(withIdentifier: "suge2", sender: nil)
                }
                }
            return cell
        }else {
            return myProdectOrderCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: orders[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? myOrderDeatils {
            if let prodact = sender as? myordersProdect {
                distantion.singleItem = prodact
            }
        }else if let  reviewVC = segue.destination as? reviewVendorProdectVC {
            reviewVC.ids = id
            reviewVC.orderCurrency = order_currency
            reviewVC.orderDate = orderDate
            reviewVC.orderTotla = orderTotla
        }
    }
}
