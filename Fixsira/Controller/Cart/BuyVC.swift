//
//  BuyVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/18/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class BuyVC: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var add1: UITextField!
    @IBOutlet weak var phone1: UITextField!
    @IBOutlet weak var email1: UITextField!
    @IBOutlet weak var note: UITextView!
    
    var orderId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buyBtn(_ sender: Any) {
        
        guard let names = name.text, !names.isEmpty else {
            let messages = NSLocalizedString("enter your name", comment: "hhhh")
            let title = NSLocalizedString("Order Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let add1s = add1.text, !add1s.isEmpty else {
            let messages = NSLocalizedString("enter your adddress", comment: "hhhh")
            let title = NSLocalizedString("Order Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
//        guard let city1s = city1.text, !city1s.isEmpty else {
//            self.showAlert(title: "Order Filed", message: "enter your city")
//            return
//        }
        
//        guard let postcode1s = postcode1.text, !postcode1s.isEmpty else {
//            self.showAlert(title: "Order Filed", message: "enter your postcode")
//            return
//        }
        
        guard let phone1s = phone1.text, !phone1s.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("Order Filed", comment: "hhhh")
            self.showAlert(title: "Order Filed", message: messages)
            return
        }
        
        guard let email1s = email1.text, !email1s.isEmpty else {
            let messages = NSLocalizedString("enter your email", comment: "hhhh")
            let title = NSLocalizedString("Order Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }

    
        API_Buy.Buying(order_note: note.text ?? "", name: name.text ?? "", company_name: "", email: email1.text ?? "", phone: phone1.text ?? "", fax: "", adddress: add1.text ?? "", city:  "", postcode:  "") { (error:Error?, success: Bool, order_id) in
            if success{
                self.orderId = order_id ?? 0
                print("0000\(self.orderId)")
                let messages = NSLocalizedString("your order Id is", comment: "hhhh")
                let title = NSLocalizedString("Order Success", comment: "hhhh")
                self.showAlert(title: title, message: "\(messages) \(self.orderId)")
            }else{
            }
            let messages = NSLocalizedString("your order Id is", comment: "hhhh")
            let title = NSLocalizedString("Order Success", comment: "hhhh")
            self.showAlert(title: title, message: "\(messages) \(self.orderId)")
        }
        
        func getCountCart() {
            API_Cart.countCart { (error: Error?, Success, count) in
                print("mmmmm\(count ?? 0)")
                let Cart = NSLocalizedString("Cart", comment: "Cart")
                self.tabBarController?.tabBar.items?[2].title = "\(Cart) \((count ?? 0))"
            }
        }
    }
}
