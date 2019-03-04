//
//  profileVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class profileVC: UIViewController {

   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var carModle: UILabel!
    @IBOutlet weak var carYear: UILabel!
    @IBOutlet weak var viwess: UIView!
    
    var counts = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
        getCountCart()
        
        if helper.getAPIToken() != nil {
            viwess.isHidden = true
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logOut", style: .plain, target: self, action: #selector(Logout))
        }else {
            viwess.isHidden = false
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefresh()
        getCountCart()
        
        
    }
    
    @objc func Logout() {
        helper.dleteAPIToken()
    }
    
    @objc func getCountCart() {
        API_Cart.countCart { (error: Error?, Success, count) in
            print("mmmmm\(count ?? 0)")
            let Cart = NSLocalizedString("Cart", comment: "Cart")
            self.tabBarController?.tabBar.items?[2].title = "\(Cart) \((count ?? 0))"
        }
    }
    
    @objc private func handleRefresh() {
        API_profile.profile { (error: Error?, success, name,email,phone,carModle,carYear) in
            self.name.text = name ?? ""
            print(self.name)
            self.email.text = email ?? ""
            self.phone.text = phone ?? ""
            self.carYear.text = carYear ?? ""
            self.carModle.text = carModle ?? ""
            }
        }
    @IBAction func lan(_ sender: Any) {
        if Language.currentLanguage() == "ar" {
            Language.setAppLanguage(lang: "en-US")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
            Language.setAppLanguage(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let api_token = helper.getAPIToken(){
            print(api_token)
            //            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "swrer")
            //            window?.rootViewController = tab
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "main")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
        }else{
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "nave")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
        
    }    
    @IBAction func logoutBtn(_ sender: Any) {
        helper.dleteAPIToken()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? editProfile{
            distantion.names = name.text ?? ""
            distantion.phones = phone.text ?? ""
            distantion.carYears = carYear.text ?? ""
            distantion.carModels = carModle.text ?? ""
            
        }
    }
    
}
