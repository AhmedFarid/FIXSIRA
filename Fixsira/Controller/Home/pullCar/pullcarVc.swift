//
//  pullcarVc.swift
//  Fixsira
//
//  Created by FARIDO on 10/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import CoreLocation

class pullcarVc: UIViewController, UITableViewDataSource, UITableViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var tabelView: UITableView!
    var services = [PullCar]()
    
    //var carmodelId = 0
    var lat = 0.0
    var long = 0.0
    //var typeId = ""
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
        API_Services.pullCarData(car_model_id: 0, type_id: "1", type: "pull_washing", type_vist: "1"){ (error: Error?, services: [PullCar]?) in
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
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? pullCarCell {
            let cells = services[indexPath.row]
            let myLocation = CLLocation(latitude: self.lat, longitude: self.long)
            let CenerLocatin = CLLocation(latitude: Double(cells.centerLat) ?? 0.0, longitude: Double(cells.centerLng) ?? 0.0)
            cell.distance.text = "\(Int(myLocation.distance(from: CenerLocatin) / 1000)) KM"
            cell.configuerCell(prodect: cells)
            return cell
        }else {
            return pullCarCell()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: services[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? pullCarVC2{
            if let prodacet = sender as? PullCar {
                distantion.singelItem = prodacet
            }
        }
    }
}



