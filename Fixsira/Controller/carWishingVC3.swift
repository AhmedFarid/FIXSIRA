//
//  carWishingVC3.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher


final class vendoAnnoutation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

class carWishingVC3: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var addresss: UILabel!
    @IBOutlet weak var mapp: MKMapView!
    
    
    var singelItems: vendorProfile?
    var ima = ""
    var rates = ""
    var carmodelId = 0
    var typeId = ""
    var locationId = ""
    var vendorID = 0
    var prices = ""
    var typeFix = ""
    var services_id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = singelItems?.name
        des.text = singelItems?.descri
        addresss.text = singelItems?.address
        rate.text = rates
        price.text = prices
        
        image.image = UIImage(named: "placeholder")
        let s = ("http://fixsira.com/site\(ima)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        mapp.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let mitCoordinate = CLLocationCoordinate2D(latitude: Double(singelItems?.lat ?? "0.0") ?? 0.0, longitude: Double(singelItems?.lng ?? "0.0") ?? 0.0)
        
        let mitAnnotation = vendoAnnoutation(coordinate: mitCoordinate, title: "Vendor Location", subtitle: singelItems?.address ?? "")
        mapp.addAnnotation(mitAnnotation)
        mapp.setRegion(mitAnnotation.region, animated: true)
    }
    
    
    @IBAction func resevi(_ sender: Any) {
        guard (helper.getAPIToken() != nil)  else {
            let message = NSLocalizedString("please login frist", comment: "msg list lang")
            self.showAlert(title: "Filed", message: message)
            return
        }
        self.performSegue(withIdentifier: "suge", sender: "car_washing")
    }
    
    @IBAction func workHoursBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "workHours", sender: nil)
    }
    @IBAction func phoneCallBtn(_ sender: Any) {
        if let url = URL(string:"tel://\(singelItems?.phone ?? "")"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
//    @IBAction func phoneCall(_ sender: Any) {
//    }
    
//    @IBAction func workHours(_ sender: Any) {
//    }
    
    @IBAction func vendorBrodect(_ sender: Any) {
        self.performSegue(withIdentifier: "showProdects", sender: nil)
    }
    
    @IBAction func vendorServices(_ sender: Any) {
        self.performSegue(withIdentifier: "showServices", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let orderType = segue.destination as? orderServices {
            orderType.type = sender as! String
            orderType.typeFix = typeFix
            orderType.carmodelId = carmodelId
            orderType.typeId = typeId
            orderType.locationId = locationId
            orderType.services_id = services_id
        }else if let prodectsVendor = segue.destination as? vendorServices {
            prodectsVendor.vendorId = singelItems?.vendor_id ?? ""
            prodectsVendor.type = "car_washing"
        }else if let vendorPeodects = segue.destination as? vendorBrodect {
            vendorPeodects.vendorId = singelItems?.vendor_id ?? ""
        }else if let vendorhours = segue.destination as? workhorusVC {
            vendorhours.locationId = singelItems?.vendor_id ?? ""
        }else if let comments = segue.destination as? comenntsVc {
            comments.service_id = services_id
            comments.service_type = "car_washing"
        }
    }
        
}

extension carWishingVC3: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let vendoAnnoutationView	= mapp.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            vendoAnnoutationView.animatesWhenAdded = true
            vendoAnnoutationView.titleVisibility = .adaptive
            vendoAnnoutationView.titleVisibility = .adaptive
            
            return vendoAnnoutationView
        }
        return nil
    }
}

