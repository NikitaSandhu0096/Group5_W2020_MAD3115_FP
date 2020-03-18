//
//  Bus.swift
//  CarRentingSystem
//
//  Created by MacStudent on 2020-02-12.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class Bus  : Vehicle
{
    var identificationNumber: String
    var description: String
    var isSelfDrive: Bool
    var manufacturerName: String
    var isInsured: Bool
    var vehicleNoOfSeats: Int
    var insuranceProviderName: String
    var fuelType: String
    var ratePerDay: Float
    var ratePerKm: Float
    var driver = [Int: Driver]()
    var busType: String
    var iswifiAvailable: Bool
    var isAccessibiltyServiceAvailable: Bool
           
    init(identificationNumber: String, description: String, isSelfDrive: Bool, manufacturerName: String, isInsured: Bool, vehicleNoOfSeats: Int, insuranceProviderName: String,fuelType: String, ratePerDay: Float, ratePerKm: Float, busType : String , iswifiAvailable : Bool, isAccessibiltyServiceAvailable: Bool)
    {
             self.identificationNumber = identificationNumber
             self.description = description
             self.isSelfDrive = isSelfDrive
             self.manufacturerName = manufacturerName
             self.isInsured = isInsured
             self.vehicleNoOfSeats = vehicleNoOfSeats
             self.insuranceProviderName = insuranceProviderName
             self.fuelType = fuelType
             self.ratePerDay = ratePerDay
             self.ratePerKm = ratePerKm
             self.busType = busType
             self.iswifiAvailable = iswifiAvailable
             self.isAccessibiltyServiceAvailable = isAccessibiltyServiceAvailable
             
    }
    
    func addDriver(drivers: Driver, driverId: Int)
    {
        driver.updateValue(drivers, forKey: driverId)
    }
    
    func removeDriver(driverId: Int)
    {
        driver.removeValue(forKey: driverId)
    }
          
    func display()
    {
        print("                 ------ BUS ------       ")
        print("Bus IdentificationNumber             : \(identificationNumber)")
        print("Bus Description                      : \(description)")
        print("Bus ManufacturerName                 : \(manufacturerName)")
        print("Bus isSelfDrive                      : \(isSelfDrive)")
        print("Bus isInsured                        : \(isInsured)")
        print("Bus InsuranceProviderName            : \(insuranceProviderName)")
        print("Bus VehicleNoOfSeats                 : \(vehicleNoOfSeats)")
        print("Bus FuelType                         : \(fuelType)")
        print("Bus RatePerDay                       : \(ratePerDay.currency())")
        print("Bus ratePerKm                        : \(ratePerKm.currency())")
//        print("----------------------------------------------------")
        for d in driver{
//            print("Driver is assigned to the bus")
            d.value.display()
        }
    }
}
