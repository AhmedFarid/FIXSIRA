//
//  myOrderDeatils.swift
//  Fixsira
//
//  Created by FARIDO on 10/19/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class myOrderDeatils: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    var orders = [myordersProdectDetels]()
    var singleItem: myordersProdect?
    
    @IBOutlet weak var tabelview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabelview.delegate = self
        tabelview.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_Myorders.myOrderProdectsDetels(order_id: singleItem?.id ?? 0){ (error: Error?, orders: [myordersProdectDetels]?) in
            if let orders = orders {
                self.orders = orders
                print("xxx\(self.orders)")
                self.tabelview.reloadData()
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myProdectDetiles {
            let cells = orders[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else {
            return myProdectDetiles()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: orders[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? reviewService {
            if let prodact = sender as? myorders {
                distantion.singleItem = prodact
            }
        }
    }
}
