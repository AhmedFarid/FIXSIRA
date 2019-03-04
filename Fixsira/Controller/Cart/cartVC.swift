//
//  cartVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class cartVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var prices: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var viewsss: UIView!
    var carts = [cartData]()
    var singelItem: cartData?
    var price = 0
    
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if helper.getAPIToken() != nil {
            viewsss.isHidden = true
        }else {
            viewsss.isHidden = false
        }
        
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
        tableview.addSubview(refresher)
        handleRefresh()
        getCountCart()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefresh()
        getCountCart()
        self.tableview.reloadData()
    }
    
    var isLoading: Bool = false
    
    
    @objc func getCountCart() {
        API_Cart.countCart { (error: Error?, Success, count) in
            print("mmmmm\(count ?? 0)")
            let Cart = NSLocalizedString("Cart", comment: "Cart")
            self.tabBarController?.tabBar.items?[2].title = "\(Cart) \((count ?? 0))"
        }
    }
    
    @objc private func handleRefresh() {
        self.refresher.endRefreshing()
        guard !isLoading else { return }
        isLoading = true
        API_Cart.showcart{ (error: Error?, carts: [cartData]?,price) in
            self.isLoading = false
            if let carts = carts {
                self.carts = carts
                print("xxx\(self.carts)")
                self.tableview.reloadData()
                self.price = price ?? 0
                print("xxx \(self.price)")
                self.prices.text = "\(self.price)"
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cartCell {
            let cells = carts[indexPath.row]
            cell.configuerCell(prodect: cells)
            
            cell.addAction = {
                self.handleRefresh()
                API_Cart.addToCart(quanti: 1, vendor_id: cells.vendor_id, products_id: cells.products_id) { (error: Error?, success: Bool) in
                    if success {
                        self.handleRefresh()
                        self.tableview.reloadData()
                        //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order")
                    }else{
                        //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order ")
                    }
                    self.handleRefresh()
                    self.tableview.reloadData()
                }
                self.handleRefresh()
                self.tableview.reloadData()
            }
            
            cell.deleteAction = {
                API_Cart.deleteFromCart(products_id: cells.products_id, completion: { (error: Error?, success: Bool) in
                    self.handleRefresh()
                    if success {
                        self.handleRefresh()
                        self.tableview.reloadData()
                            API_Cart.countCart { (error: Error?, Success, count) in
                                print("mmmmm\(count ?? 0)")
                                let Cart = NSLocalizedString("Cart", comment: "Cart")
                                self.tabBarController?.tabBar.items?[2].title = "\(Cart) \((count ?? 0))"
                            
                        }
                        //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order")
                    }else{
                        //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order ")
                    }
                    self.handleRefresh()
                    self.tableview.reloadData()
                    API_Cart.countCart { (error: Error?, Success, count) in
                        print("mmmmm\(count ?? 0)")
                        let Cart = NSLocalizedString("Cart", comment: "Cart")
                        self.tabBarController?.tabBar.items?[2].title = "\(Cart) \((count ?? 0))"
                    }
                })
                self.handleRefresh()
                self.tableview.reloadData()
                API_Cart.countCart { (error: Error?, Success, count) in
                    print("mmmmm\(count ?? 0)")
                    let Cart = NSLocalizedString("Cart", comment: "Cart")
                    self.tabBarController?.tabBar.items?[2].title = "\(Cart) \((count ?? 0))"
                }
            }
            //self.handleRefresh()
            return cell
        }else {
            return cartCell()
        }
    }
    
    
    @IBAction func buyBtn(_ sender: Any) {
        if price == 0 {
            let cartmsg = NSLocalizedString("Cart Is Empty", comment: "Cart")
            self.showAlert(title: "Faild", message: cartmsg)
        }else {
            performSegue(withIdentifier: "suge", sender: nil)
        }
    }
    
}
