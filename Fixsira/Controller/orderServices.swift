//
//  orderServices.swift
//  Fixsira
//
//  Created by FARIDO on 10/14/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import CoreLocation

class orderServices: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var carName: UITextField!
    @IBOutlet weak var carModel: UITextField!
    @IBOutlet weak var carModelYear: UITextField!
    @IBOutlet weak var date: UITextField!
    
    var carmodelId = 0
    var typeId = 0
    var type = ""
    var locationId = 0
    var lat = 0.0
    var long = 0.0
    var orderId = 0
    
    
    private var datePiker: UIDatePicker?
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.startUpdatingLocation()
            
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .dateAndTime
        datePiker?.addTarget(self, action: #selector(orderServices.dateChanged(datePiker:)), for: .valueChanged)
        let tapGestuer = UITapGestureRecognizer(target: self, action: #selector(orderServices.viewTapped(gesterRecognizer:)))
        view.addGestureRecognizer(tapGestuer)
        date.inputView = datePiker
        //print("123 \(services_id)")
        print(type)
            print(typeId)
            print(locationId)
        }
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
    
    @objc func viewTapped(gesterRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        date.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func orderBtn(_ sender: Any) {
        
        guard let phones = phone.text, !phones.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your phone")
            return
        }
        
        guard let carNames = carName.text, !carNames.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your car name")
            return
        }
        
        guard let carModels = carModel.text, !carModels.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your car modle")
            return
        }
        
        guard let carModelyears = carModelYear.text, !carModelyears.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter your car modle year")
            return
        }
        
        guard let dates = date.text, !dates.isEmpty else {
            self.showAlert(title: "Order Filed", message: "enter date of services")
            return
        }
        
        API_orders.orderService(type_id: typeId , car_model_id: carmodelId , location_id: locationId , services_Type: type, lat: lat, long: long, phone: phone.text ?? "", car_name: carName.text ?? "", car_model: carModel.text ?? "", car_model_year: carModelYear.text ?? "", date: date.text ?? "") { (error: Error?, success: Bool, orderId) in
            if success {
                self.orderId = orderId ?? 0
                print("0000\(self.orderId)")
                self.showAlert(title: "Order Success", message: "your order Id is \(self.orderId)")
            }else{
                //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order ")
            }
            
            self.showAlert(title: "Order Success", message: "your order Id is \(self.orderId)")
        }
    }
}
