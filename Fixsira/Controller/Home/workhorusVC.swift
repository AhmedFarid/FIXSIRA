//
//  workhorusVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class workhorusVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tabelview: UITableView!
    var workhour = [workhoursssss]()
    var locationId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate = self
        tabelview.dataSource = self
        handleRefresh()
    }
    
    
    @objc private func handleRefresh() {
        API_Days.Days(location_id: locationId){ (error: Error?, workhour: [workhoursssss]?) in
            if let workhour = workhour {
                self.workhour = workhour
                print("xxx\(self.workhour)")
                self.tabelview.reloadData()
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workhour.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? hoursDay {
            let cells = workhour[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
            return hoursDay()
        }
    }
    
}
