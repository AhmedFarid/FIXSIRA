//
//  sparePartsCat.swift
//  Fixsira
//
//  Created by FARIDO on 10/9/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class sparePartsCat: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    
    var sparpartCats = [SparPartCat]()
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.addSubview(refresher)
        handleRefresh()
    }
    
    var isLoading: Bool = false
    var current_page = 1
    var last_page = 1
    
    @objc private func handleRefresh() {
        self.refresher.endRefreshing()
        guard !isLoading else { return }
        isLoading = true
        API.productsListCat(page: 1) { (error: Error?, sparpartCats: [SparPartCat]?, last_page: Int) in
            self.isLoading = false
            if let sparpartCats = sparpartCats {
                self.sparpartCats = sparpartCats
                print("xxx\(self.sparpartCats)")
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
        API.productsListCat(page: current_page+1) { (error: Error?, sparpartCats: [SparPartCat]?, last_page: Int) in
            self.isLoading = false
            if let sparpartCats = sparpartCats {
                self.sparpartCats.append(contentsOf: sparpartCats)
                print("xxx\(self.sparpartCats)")
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
        return sparpartCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? sparPartsCatCellCollectionViewCell{
            let spar = sparpartCats[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else {
            return sparPartsCatCellCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = self.sparpartCats.count
        if indexPath.row ==  count-1 {
            self.loadMore()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: sparpartCats[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? sparePartsVC{
            if let prodacet = sender as? SparPartCat {
                distantion.singelItem = prodacet
            }
        }
    }
}
