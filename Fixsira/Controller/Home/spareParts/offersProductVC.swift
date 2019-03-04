//
//  offersProductVC.swift
//  Fixsira
//
//  Created by farido on 12/16/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class offersProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    var sparparts = [SparParts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        HanleRefresh()
    }
    
    private func HanleRefresh() {
        API.offersProducts{ (error: Error?, sparparts: [SparParts]?) in
            
            if let sparparts = sparparts {
                self.sparparts = sparparts
                self.collection.reloadData()
                print("phoneslast \(sparparts)")
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge2", sender: sparparts[indexPath.row])
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = screenWidth
        var hight = screenWidth
        
        
        hight = hight > 164 ? 164 : hight
        
        return CGSize.init(width: width, height: hight)
    }
}
