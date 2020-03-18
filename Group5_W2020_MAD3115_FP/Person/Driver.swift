//
//  Driver.swift
//  CarRentingSystem
//
//  Created by Nikita Sandhu on 2020-02-19.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class Driver : Person{
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
    
    var drivingLicenseNumber : String
    var isDrivingHistoryCleared : Bool
    var salary : Int
    
    init(id: Int, firstName: String, lastName: String, gender: Gender, birthDate: String, mobileNumber: String, email: String, userName: String, password: String, drivingLicenseNumber : String, isDrivingHistoryCleared : Bool, salary : Int) throws {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        self.mobileNumber = mobileNumber
        if(!email.emailValid()){
            throw DriverError.InvalidEmail
        }
        self.email = email
        self.userName = userName
        self.password = password
        self.drivingLicenseNumber = drivingLicenseNumber
        self.isDrivingHistoryCleared = isDrivingHistoryCleared
        self.salary = salary
    }
    
//    func setEmail(email : String?){
//        guard (email?.emailValid())! == true else {
//            return
//        }
//        self.email = email!
//    }
    
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
    
     func display() {
        print(" \n          ------ DRIVER DETAILS ------\n")
        print("Driver's ID                          : \(self.id)")
        print("Driver's First Name                  : \(self.firstName)")
        print("Driver's Last Name                   : \(self.lastName)")
        print("Driver's gender                      : \(self.gender)")
        print("Driver's Birth Date                  : \(self.birthDate)")
        print("Driver's Age                         : \(calculateAge())")
        print("Driver's Mobile Number               : \(self.mobileNumber)")
        print("Driver's email                       : \(self.email)")
        print("Driver's username                    : \(self.userName)")
        print("Driver's password                    : \(self.password)")
        print("Driver's Driving License Number      : \(self.drivingLicenseNumber)")
        print("Driver's Driving History Cleared     : \(self.isDrivingHistoryCleared)")
        print("Driver's Salary                      : \(self.salary)")
    }
}
