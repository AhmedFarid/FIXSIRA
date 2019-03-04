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
        
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
        
        // Replace 'YOUR_APP_ID' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions,appId: "8d14ede9-7d53-4870-b9f4-24b9e34fb687",handleNotificationAction: nil,settings: onesignalInitSettings)
        
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
        
        // Recommend moving the below line to prompt for push after informing the user about
        //   how your app will use them.
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
            let userId = OneSignal.getPermissionSubscriptionState().subscriptionStatus.userId
            API_Login.notifacation(player_ids: userId ?? "") { (error: Error?, success: Bool, message) in
                if success {
                    print("mmmmmmmmm\(message ?? "") \(userId ?? "")")
                }else{
                }
            }
        })
        
        return FBSDKApplicationDelegate.sharedInstance().application( application, didFinishLaunchingWithOptions : launchOptions)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    
}

