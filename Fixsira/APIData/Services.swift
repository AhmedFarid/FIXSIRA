//"rating" : 0,
//"centerPhone" : "01096981025",
//"centerTelephone" : "01096981010",
//"centerLat" : "30.06330019631517",
//"visitPrice" : "360",
//"centerDescription" : "welcome to this services center",
//"centerAddress" : "6 october",
//"total" : 0,
//"vendorName" : "Basem",
//"centerLng" : "31.173972764015048",
//"centerName" : "Alfatah",
//"vendorId" : "2",
//"totalPrice" : "1860",
//"centerId" : "1",
//"image" : "",
//"price" : "1500"

import UIKit
import SwiftyJSON

class Services: NSObject {
    
    
    
    var servicesId: String
    var centerLat: String
    var centerId: String
    var centerAddress: String
    var centerDescription: String
    var centerLng: String
    var centerName: String
    var vendorName: String
    var rating: Int
    var total: Int
    var centerPhone: String
    var price: String
    var image: String
    var visitPrice: String
    var centerTelephone: String
    var vendorId: String
    var totalPrice: String
    
    init?(dict: [String: JSON]){
        
        if  let totalPrice = dict["totalPrice"]?.string {
            self.totalPrice = totalPrice
        }else{
            self.totalPrice = ""
        }
        
        if  let visitPrice = dict["visitPrice"]?.string {
            self.visitPrice = visitPrice
        }else{
            self.visitPrice = ""
        }
        
        guard let servicesId = dict["servicesId"]?.string,let centerLat = dict["centerLat"]?.string ,let centerId = dict["centerId"]?.string ,let centerAddress = dict["centerAddress"]?.string ,let centerDescription = dict["centerDescription"]?.string ,let centerLng = dict["centerLng"]?.string ,let centerName = dict["centerName"]?.string ,let vendorName = dict["vendorName"]?.string ,let rating = dict["rating"]?.int ,let total = dict["total"]?.int ,let centerPhone = dict["centerPhone"]?.string ,let price = dict["price"]?.string ,let image = dict["image"]?.string ,let centerTelephone = dict["centerTelephone"]?.string ,let vendorId = dict["vendorId"]?.string else {return nil}
        
       
        
        self.servicesId = servicesId
        self.centerLat = centerLat
        self.centerId = centerId
        self.centerAddress = centerAddress
        self.centerDescription = centerDescription
        self.centerLng = centerLng
        self.centerName = centerName
        self.vendorName = vendorName
        self.rating = rating
        self.total = total
        self.centerPhone = centerPhone
        self.price = price
        self.image = image
        
        self.centerTelephone = centerTelephone
        self.vendorId = vendorId
        
    }
}

//"centerLat" : "30.06330019631517",
//"total" : 0,
//"centerTelephone" : "01096981010",
//"centerId" : "1",
//"vendorId" : "2",
//"PullDescription" : "asdasdasd asd asd ad",
//"pullImage" : "\/public\/uploads\/1542634693-h-100-Hino-logo.png",
//"pullPrice" : "5200",
//"nameVendor" : "basem",
//"rating" : 0,
//"centerAddress" : "6 october",
//"centerName" : "Alfatah",
//"pullId" : "7",
//"imageVendor" : "",
//"pullName" : "waleed said",
//"centerPhone" : "01096981025",
//"centerLng" : "31.173972764015048"




class PullCar: NSObject {
    
    var centerLat: String
    var total: Int
    var centerTelephone: String
    var centerId: String
    var vendorId: String
    var PullDescription: String
    var pullImage: String
    var pullPrice: String
    var nameVendor: String
    var rating: Int
    var centerAddress: String
    var centerName: String
    var pullId: String
    var imageVendor: String
    var pullName: String
    var centerPhone: String
    var centerLng: String

    
    
    init?(dict: [String: JSON]){
        
        guard let centerLat = dict["centerLat"]?.string, let total = dict["total"]?.int, let centerTelephone = dict["centerTelephone"]?.string, let centerId = dict["centerId"]?.string, let vendorId = dict["vendorId"]?.string, let PullDescription = dict["PullDescription"]?.string, let pullImage = dict["pullImage"]?.string, let pullPrice = dict["pullPrice"]?.string, let nameVendor = dict["nameVendor"]?.string,  let rating = dict["rating"]?.int, let centerAddress = dict["centerAddress"]?.string, let centerName = dict["centerName"]?.string, let pullId = dict["pullId"]?.string, let imageVendor = dict["imageVendor"]?.string, let pullName = dict["pullName"]?.string, let centerPhone = dict["centerPhone"]?.string, let centerLng = dict["centerLng"]?.string else {return nil}
        
        self.centerLat = centerLat
        self.total = total
        self.centerTelephone = centerTelephone
        self.centerId = centerId
        self.vendorId = vendorId
        self.PullDescription = PullDescription
        self.pullImage = pullImage
        self.pullPrice = pullPrice
        self.nameVendor = nameVendor
        self.rating = rating
        self.centerAddress = centerAddress
        self.centerName = centerName
        self.pullId = pullId
        self.imageVendor = imageVendor
        self.pullName = pullName
        self.centerPhone = centerPhone
        self.centerLng = centerLng
        
        
       
    }
}


//"vendorId": "2",
//"vendorName": "Basem",
//"image": "",
//"centerId": "1",
//"centerName": "Alfatah",
//"centerAddress": "6 october",
//"centerDescription": "welcome to this services center",
//"centerPhone": "01096981025",
//"centerTelephone": "01096981010",
//"centerLat": "30.06330019631517",
//"centerLng": "31.173972764015048",
//"price": "300",
//"visitPrice": "0",
//"totalPrice": "300",
//"total": 0,
//"rating": 0


//"vendorId": "2",
//"vendorName": "Basem",
//"image": "",
//"centerId": "1",
//"centerName": "Alfatah",
//"centerAddress": "6 october",
//"centerDescription": "welcome to this services center",
//"centerPhone": "01096981025",
//"centerTelephone": "01096981010",
//"centerLat": "30.06330019631517",
//"centerLng": "31.173972764015048",
//"price": "200",
//"visitPrice": "50",
//"totalPrice": "250",
//"total": 0,
//"rating": 0
