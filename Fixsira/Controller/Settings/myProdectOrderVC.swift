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
                self.performSegue(withIdentifier: "suge2", sender: cells._order_currency)
                
                func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    guard let reviewVC = segue.destination as? reviewVendorProdectVC else {return}
                    reviewVC.ids = cells.id
                    reviewVC.orderCurrency = sender as! String
                    reviewVC.orderDate = cells._order_date
                    reviewVC.orderTotla = cells._order_total
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
        }
    }
}
