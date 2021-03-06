//
//  serviceTypeVC.swift
//  Fixsira
//
//  Created by FARIDO on 10/21/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class serviceTypeVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    var carModels = [servicesType]()
    var servicetype = [servicestypes]()
    var setlectServices = [NSLocalizedString("Mobile Service", comment: "hhhh"),NSLocalizedString("On Site", comment: "hhhh")]
    
    var carModelId = 0
    var serviceTypeId = ""
    var seleectServiceType = ""
    
    @IBOutlet weak var carModel: UIPickerView!
    @IBOutlet weak var serviceType: UIPickerView!
    @IBOutlet weak var selectServices: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carModel.delegate = self
        carModel.dataSource = self
        
        serviceType.delegate = self
        serviceType.dataSource = self
        
        selectServices.delegate = self
        selectServices.dataSource = self
        
        handleRefresh()
        //handleRefreshs()
    }

    
    @objc private func handleRefreshs() {
        API_servicesTypecar.servicesTypes (type: "car_maintenance") {(error: Error?, servicetype: [servicestypes]?) in
            if let servicetype = servicetype {
                self.servicetype = servicetype
                print("xxx\(self.servicetype)")
                self.serviceType.reloadAllComponents()
            }
        }
        
    }
    
    @objc private func handleRefresh() {
        API_serviceType.carModle{ (error: Error?, carModels: [servicesType]?) in
            if let carModels = carModels {
                self.carModels = carModels
                print("xxx\(self.carModels)")
                self.carModel.reloadAllComponents()
            }
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 1
        } else if pickerView.tag == 1 {
            return 1
        }else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return carModels.count
        } else if pickerView.tag == 1{
            return servicetype.count
        } else {
            return setlectServices.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return carModels[row].models
        }else if pickerView.tag == 1{
            return servicetype[row].name
        }else{
            return setlectServices[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
                self.carModelId = carModels[row].id
                handleRefreshs()
        }else if pickerView.tag == 1{
            if servicetype.isEmpty == true {
                print("no")
            }else {
                self.serviceTypeId = servicetype[row].id
            }
        }else {
           if setlectServices[row] == "في المركز" {
                self.seleectServiceType = "On Site"
            } else if setlectServices[row] == "On Site"{
                self.seleectServiceType = "On Site"
            }else {
                self.seleectServiceType = "Mobile Service"
            }
            print("\(self.seleectServiceType)")
            //self.seleectServiceType = setlectServices[row]
        }
    }
    
    
    
    @IBAction func searchBtn(_ sender: Any) {
        if carModelId != 0 && serviceTypeId != "" {
            self.performSegue(withIdentifier: "suge", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sevice = segue.destination as? carMaintVC else { return }
        sevice.carmodelId = carModelId
        sevice.typeId = serviceTypeId
        sevice.selectServiec = seleectServiceType
        sevice.typeFix = seleectServiceType
    }
    
}
