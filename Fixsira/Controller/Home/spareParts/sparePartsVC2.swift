//
//  sparePartsVC2.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class sparePartsVC2: UIViewController,UICollectionViewDelegate ,UICollectionViewDataSource {
    
    var singelItem: SparParts?
    //var singleItemGalry: SparPartGalrys?
    var sparpartGalrys = [SparPartGalrys]()
    
    @IBOutlet weak var stokAvaiTXT: UILabel!
    @IBOutlet weak var Detiles: UILabel!
    @IBOutlet weak var priceTXT: UILabel!
    @IBOutlet weak var partnameTXT: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("cx\(sparpartGalrys)")
        collection.delegate = self
        collection.dataSource = self
        
        handleRefreshGalry()
        
        self.navigationItem.title = singelItem?.title
        stokAvaiTXT.text = singelItem?.stock_availability
        Detiles.text = singelItem?.content
        priceTXT.text = singelItem?.sale_price
        partnameTXT.text = singelItem?.title
        
        let s = ("http://fixsira.com/"+(singelItem?.image_url)!)
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    @objc private func handleRefreshGalry(){
        API.productsListGalry(product_id: singelItem?.id ?? "") {(error: Error?, sparpartGalrys: [SparPartGalrys]?) in
            if let sparpartGalrys = sparpartGalrys {
                self.sparpartGalrys = sparpartGalrys
                print("xxx\(self.sparpartGalrys)")
                self.collection.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sparpartGalrys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? galryCell {
            let spar = sparpartGalrys[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else {
            return galryCell()
        }
        
    }
    
    @IBAction func addToCart(_ sender: Any) {
        API_Cart.addToCart(vendor_id: singelItem?.author_id ?? "", products_id: singelItem?.id ?? "") { (error: Error?, success: Bool) in
            if success {
                self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order")
            }else{
                self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order ")
            }
            //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order ")
        }
        //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order ")
    }
}
