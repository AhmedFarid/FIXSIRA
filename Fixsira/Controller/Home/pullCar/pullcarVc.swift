//
//  pullcarVc.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class pullcarVc: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabelview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelview.delegate = self
        tabelview.dataSource = self

        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tabelview.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        return cell
    }

}
