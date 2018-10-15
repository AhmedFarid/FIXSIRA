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
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
        
    }
    @objc private func handleRefresh() {
        API_profile.profile { (error: Error?, success, name,email) in
            self.name.text = name ?? ""
            print(self.name)
            self.email.text = email ?? ""
            }
        }
    }
