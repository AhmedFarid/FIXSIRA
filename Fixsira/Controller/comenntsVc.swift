//
//  comenntsVc.swift
//  Fixsira
//
//  Created by farido on 12/20/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class comenntsVc: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var comments = [commets]()
    var id = ""
    var service_id = ""
    var service_type = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        handleRefresh()
        handleRefreshss()
    }
    
    
    @objc private func handleRefresh() {
        API_Comments.DaysServices(location_id: id){ (error: Error?, comments: [commets]?) in
            if let comments = comments {
                self.comments = comments
                print("xxx\(self.comments)")
                self.tableView.reloadData()
            }
        }
        
    }
    
    @objc private func handleRefreshss() {
        API_Comments.Days(service_id: service_id, service_type: service_type){ (error: Error?, comments: [commets]?) in
            if let comments = comments {
                self.comments = comments
                print("xxx\(self.comments)")
                self.tableView.reloadData()
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? commentsCell {
            let cells = comments[indexPath.row]
            cell.configuerCell(prodect: cells)
            return cell
        }else{
            return commentsCell()
        }
    }
    
}

