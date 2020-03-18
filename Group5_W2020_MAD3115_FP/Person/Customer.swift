//
//  Customer.swift
//  CarRentingSystem
//
//  Created by MacStudent on 2020-02-12.
//  Copyright © 2020 MacStudent. All rights reserved.
//
import Foundation

class Customer : Person{

    var id: Int
    var firstName: String
    var lastName: String
    var gender: Gender
    var birthDate: String
    var age: Int = 0
    var mobileNumber: String
    var email: String
    var userName: String
    var password: String
    
    var address : String
    var city : String
    var vehicleListRented = [Int : VehicleRent]()
    var amountToPayForAllRentedVehicles : Float = 0.0
        
    init(id: Int, firstName: String, lastName: String, gender: Gender, birthDate: String, mobileNumber: String, email: String, userName: String, password: String, address : String, city : String) throws {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        self.mobileNumber = mobileNumber
        self.email = email
        self.userName = userName
        self.password = password
        self.address = address
        self.city = city
    }
    
    func calculateBirthDate(string : String) -> Date {      //https://stackoverflow.com/questions/35700281/date-format-in-swift
        
        let dateformatGet1 = DateFormatter()
        dateformatGet1.dateFormat = "dd/MM/yyyy"
     
        let birthDate1 : Date? = dateformatGet1.date(from: birthDate)
        return birthDate1!
    }
    
    func calculateAge() -> Int{            //https://stackoverflow.com/questions/24723431/swift-days-between-two-nsdates
        
        let now = Date()
        let current = Calendar.current
        let numberOfYears = current.dateComponents([Calendar.Component.year], from: calculateBirthDate(string: birthDate), to: now)
        return numberOfYears.year!
    }
    
    func addVehicleRent(vehicleRent: VehicleRent, vehicleRentID: Int){
        vehicleListRented.updateValue(vehicleRent, forKey: vehicleRentID)
    }
    
    func removeVehicleRent(vehicleRentID: Int){
        vehicleListRented.removeValue(forKey: vehicleRentID)
    }
    
    func display() {
    print("\n        ------ CUSTOMER DETAILS ------     \n  ")

    print("====================================================")
    print("Customer's ID                    : \(self.id)")
    print("Customer's First Name            : \(self.firstName)")
    print("Customer's Last Name             : \(self.lastName)")
    print("Customer's gender                : \(self.gender)")
    print("Customer's Birth Date            : \(self.birthDate)")
    print("Customer's Age                   : \(calculateAge())")
    print("Customer's Mobile Number         : \(self.mobileNumber)")
    print("Customer's email                 : \(self.email)")
    print("Customer's username              : \(self.userName)")
    print("Customer's password              : \(self.password)")
    print("Customer's Address               : \(self.address)")
    print("Customer's City                  : \(city)")
    print("----------------------------------------------------")
    if vehicleListRented.count == 0{
        print("         This person didn't rent any vehicle")
         print("====================================================")
        
    }else{
        for v in vehicleListRented
        {
                v.value.display()
        }
            for j in vehicleListRented
            {
                amountToPayForAllRentedVehicles = amountToPayForAllRentedVehicles + j.value.totalBillToPay
            }
        print("Amount to pay for all the rented vehicles :\(amountToPayForAllRentedVehicles.currency())")
            print("====================================================")
        }
    }
}
