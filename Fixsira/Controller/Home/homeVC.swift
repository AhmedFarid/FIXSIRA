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
    @IBOutlet weak var pageControl: UIPageControl!
    
    var Banners = [bannerData]()
    
    var currentIndex = 0
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        banner.delegate = self
        banner.dataSource = self
        
        handleRefresh()
        getCountCart()
    }
    
    @objc func getCountCart() {
        API_Cart.countCart { (error: Error?, Success, count) in
            print("mmmmm\(count ?? 0)")
            let Cart = NSLocalizedString("Cart", comment: "Cart")
            self.tabBarController?.tabBar.items?[2].title = "\(Cart) \((count ?? 0))"
        }
    }
    
    @objc private func handleRefresh() {
        API_banner.banner{ (error: Error?, Banners: [bannerData]?) in
            if let Banners = Banners {
                self.Banners = Banners
                print("xxx\(self.Banners)")
                self.banner.reloadData()
                self.pageControl.numberOfPages = Banners.count
                self.startTimer()
            }
        }
        
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        
        let desiredScrollPosititon = (currentIndex < Banners.count - 1) ? currentIndex + 1 : 0
        banner.scrollToItem(at: IndexPath(item: desiredScrollPosititon, section: 0), at: .centeredHorizontally, animated: true)
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
             return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            currentIndex = Int(scrollView.contentOffset.x / banner.frame.size.width)
            pageControl.currentPage = currentIndex
    }

}
