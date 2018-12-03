//
//  carMaintVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/3/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import CoreLocation

class carMaintVC: UIViewController, UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate{

    @IBOutlet weak var tabelView: UITableView!
    var services = [Services]()
    var carmodelId = 0
    var typeId = ""
    var selectServiec = ""
    var typeFix = ""
    var lat = 0.0
    var long = 0.0
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.startUpdatingLocation()
        }
        
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
        handleRefresh()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            //print("mmmm\(location.coordinate)")
            self.lat = location.coordinate.latitude
            self.long = location.coordinate.longitude
            print("aaaaaa\(self.lat),\(self.long)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisable()
        }
    }
    
    func showLocationDisable() {
        
        let alertController = UIAlertController(title: "Background Loacation Access Disable", message: "in order to we need your location", preferredStyle: .alert)
        
        let canncelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(canncelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController,animated: true, completion: nil)
    }
    
    
    @objc private func handleRefresh() {
        API_Services.servicesData(car_model_id: carmodelId, type_id: typeId, type: "car_maintenance", type_vist: selectServiec){ (error: Error?, services: [Services]?) in
            if let services = services {
                self.services = services
                print("xxx\(self.services)")
                self.tabelView.reloadData()
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? carMaintCell {
            let cells = services[indexPath.row]
            let myLocation = CLLocation(latitude: self.lat, longitude: self.long)
            let CenerLocatin = CLLocation(latitude: Double(cells.centerLat) ?? 0.0, longitude: Double(cells.centerLng) ?? 0.0)
            cell.telephone.text = "\(Int(myLocation.distance(from: CenerLocatin) / 1000)) KM"
            if typeFix == "Mobile Service"{
                cell.phone.text = cells.totalPrice
            }else {
                cell.phone.text = cells.price
            }
            cell.configuerCell(prodect: cells)
            return cell
        }else {
            return carMaintCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: services[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? carMaintVC2{
            distantion.carmodelId = carmodelId
            distantion.typeId = typeId
            distantion.typeFix = typeFix
            if let prodacet = sender as? Services {
                distantion.singelItem = prodacet
            }
        }
    }
}
