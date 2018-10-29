//
//  sparePartsVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class sparePartsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchTxt: UITextField!
    
    var singelItem: SparPartCat?
    var sparparts = [SparParts]()
    //var singlItemGalry: SparPartGalrys?
    var sparpartGalrys = [SparPartGalrys]()
    
    
    lazy var refresher: UIRefreshControl = {
       let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = singelItem?.name
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.addSubview(refresher)
        handleRefresh()
        //handleRefreshGalry()
    }
    var isLoading: Bool = false
    var current_page = 1
    var last_page = 1
    
    
//    @objc private func handleRefreshGalry() {
//        self.refresher.endRefreshing()
//        guard !isLoading else { return }
//        isLoading = true
//        API.productsListGalry(cat_id: singelItem?.term_id ?? "", srch_term: searchTxt.text ?? "",page: 1) { (error: Error?, sparpartGalrys: [SparPartGalrys]?, last_page: Int) in
//            self.isLoading = false
//            if let sparpartGalrys = sparpartGalrys {
//                self.sparpartGalrys = sparpartGalrys
//                print("123\(self.sparpartGalrys)")
//                self.collection.reloadData()
//                self.current_page = 1
//                self.last_page = last_page
//            }
//        }
//
//    }
    
     @objc private func handleRefresh() {
        self.refresher.endRefreshing()
        guard !isLoading else { return }
        isLoading = true
        API.productsList(vendor_Id: "", cat_id: singelItem?.term_id ?? "", srch_term: searchTxt.text ?? "",page: 1) { (error: Error?, sparparts: [SparParts]?, last_page: Int) in
            self.isLoading = false
            if let sparparts = sparparts {
                self.sparparts = sparparts
                print("xxx\(self.sparparts)")
                self.collection.reloadData()
                self.current_page = 1
                self.last_page = last_page
            }
        }
        
    }
    
    fileprivate func loadMore() {
        guard !isLoading else {return}
        guard current_page < last_page else {return}
        isLoading = true
        API.productsList(vendor_Id: "", cat_id: singelItem?.term_id ?? "", srch_term: searchTxt.text ?? "", page: current_page+1) { (error: Error?, sparparts: [SparParts]?, last_page: Int) in
            self.isLoading = false
            if let sparparts = sparparts {
                self.sparparts.append(contentsOf: sparparts)
                print("xxx\(self.sparparts)")
                self.collection.reloadData()
                self.current_page += 1
                self.last_page = last_page
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sparparts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? sparPartsCell {
            let spar = sparparts[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else {
            return sparPartsCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = self.sparparts.count
        if indexPath.row ==  count-1 {
            self.loadMore()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segu", sender: sparparts[indexPath.row])
        //performSegue(withIdentifier: "segu", sender: sparpartGalrys[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? sparePartsVC2{
            if let prodacet = sender as? SparParts {
                distantion.singelItem = prodacet
                //distantion.singelIt = sparpartGalrys
            }
        }
    }
    
    @IBAction func searchBTN(_ sender: Any) {
        guard let email = searchTxt.text, !email.isEmpty else {return}
        API.productsList(vendor_Id: "", cat_id: singelItem?.term_id ?? "", srch_term: searchTxt.text ?? "" ) { (error: Error?, sparparts: [SparParts]?, last_page: Int) in
            self.isLoading = false
            if let sparparts = sparparts {
                self.sparparts = sparparts
                print("xxx\(self.sparparts)")
                self.collection.reloadData()
//                self.current_page += 1
//                self.last_page = last_page
            }
        }
    }	
}


