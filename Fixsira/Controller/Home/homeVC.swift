//
//  homeVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class homeVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var banner: UICollectionView!
    
    var Banners = [bannerData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner.delegate = self
        banner.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_banner.banner{ (error: Error?, Banners: [bannerData]?) in
            if let Banners = Banners {
                self.Banners = Banners
                print("xxx\(self.Banners)")
                self.banner.reloadData()
            }
        }
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  let cell = banner.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? bannerCell{
            let banner = Banners[indexPath.row]
            cell.configuerCell(prodect: banner)
            return cell
        }else{
            return bannerCell()
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
