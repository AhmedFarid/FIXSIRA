//
//  myorderHomeVC.swift
//  Fixsira
//
//  Created by farid on 3/3/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit

class myorderHomeVC: UIViewController {

    @IBOutlet weak var viwess: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if helper.getAPIToken() != nil {
            viwess.isHidden = true
        }else {
            viwess.isHidden = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
