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
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var add1: UITextField!
    @IBOutlet weak var city1: UITextField!
    @IBOutlet weak var postcode1: UITextField!
    @IBOutlet weak var phone1: UITextField!
    @IBOutlet weak var fax: UITextField!
    @IBOutlet weak var email1: UITextField!
    @IBOutlet weak var note: UITextView!
    
    var orderId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buyBtn(_ sender: Any) {
        
        guard let names = name.text, !names.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your name")
            return
        }
        
        guard let add1s = add1.text, !add1s.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your adddress")
            return
        }
        
        guard let city1s = city1.text, !city1s.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your city")
            return
        }
        
        guard let postcode1s = postcode1.text, !postcode1s.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your postcode")
            return
        }
        
        guard let phone1s = phone1.text, !phone1s.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your phone")
            return
        }
        
        guard let email1s = email1.text, !email1s.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your email")
            return
        }

    
        API_Buy.Buying(order_note: note.text ?? "", name: name.text ?? "", company_name: company.text ?? "", email: email1.text ?? "", phone: phone1.text ?? "", fax: fax.text ?? "", adddress: add1.text ?? "", city: city1.text ?? "", postcode: postcode1.text ?? "") { (error:Error?, success: Bool, order_id) in
            if success{
                self.orderId = order_id ?? 0
                print("0000\(self.orderId)")
                self.showAlert(title: "Order Success", message: "your order Id is \(self.orderId)")
            }else{
            }
            self.showAlert(title: "Order Success", message: "your order Id is \(self.orderId)")
        }
    }
}
