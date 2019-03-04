//
//  AppDelegate.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import FBSDKCoreKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: UIControl.State.highlighted)

        
        
        IQKeyboardManager.shared.enable = true
        
        if let user_token = helper.getAPIToken(){
            print("user_token\(user_token)")
            //go to main page
            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
            window?.rootViewController = tab
        }
        
        Localizer.DoTheExchange()
        
        return FBSDKApplicationDelegate.sharedInstance().application( application, didFinishLaunchingWithOptions : launchOptions)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    
}

