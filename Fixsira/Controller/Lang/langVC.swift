//
//  langVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class langVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @IBAction func ar(_ sender: Any) {
        if Language.currentLanguage() == "en-US" {
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
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "login2")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
    }
    
    
    
    
    @IBAction func en(_ sender: Any) {
        if Language.currentLanguage() == "ar" {
            Language.setAppLanguage(lang: "en-US")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
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
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "login2")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        
    }
}

@IBDesignable extension UINavigationController {
    @IBInspectable var barTintColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            navigationBar.barTintColor = uiColor
        }
        get {
            guard let color = navigationBar.barTintColor else { return nil }
            return color
        }
    }
    @IBInspectable var barTextColor: UIColor? {
        set {
            guard let uiColor = newValue else {return}
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: uiColor]
        }
        get {
            guard let textAttributes = navigationBar.titleTextAttributes else { return nil }
            return textAttributes[NSAttributedString.Key.foregroundColor] as? UIColor
        }
    }
}
