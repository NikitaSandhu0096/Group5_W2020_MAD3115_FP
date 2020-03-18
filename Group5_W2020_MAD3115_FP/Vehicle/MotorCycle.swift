//
//  Bus.swift
//  CarRentingSystem
//
//  Created by MacStudent on 2020-02-12.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class MotorCycle : Vehicle
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
         var maxTopSpeed: Int
         var milage: Int
           
    init(identificationNumber: String, description: String,manufacturerName: String,isSelfDrive: Bool,  isInsured: Bool,  insuranceProviderName: String,vehicleNoOfSeats: Int, fuelType: String, ratePerDay: Float, ratePerKm: Float, maxTopSpeed : Int, milage : Int)
         {
                self.identificationNumber = identificationNumber
                self.description = description
                self.manufacturerName = manufacturerName
                self.isSelfDrive = isSelfDrive
                self.vehicleNoOfSeats = vehicleNoOfSeats
                self.isInsured = isInsured
                self.insuranceProviderName = insuranceProviderName
                self.fuelType = fuelType
                self.ratePerDay = ratePerDay
                self.ratePerKm = ratePerKm
                self.maxTopSpeed = maxTopSpeed
                self.milage = milage
         }
          
         func display()
         {

            print("             ------MOTORCYCLE------")
            print("Motorcycle's IdentificationNumber        : \(identificationNumber)")
            print("Motorcycle's Description                 : \(description)")
            print("Motorcycle's ManufacturerName            : \(manufacturerName)")
            print("Motorcycle's isSelfDrive                 : \(isSelfDrive)")
            print("Motorcycle's isInsured                   : \(isInsured)")
            print("Motorcycle's InsuranceProviderName       : \(insuranceProviderName)")
            print("Motorcycle's VehicleNoOfSeats            : \(vehicleNoOfSeats)")
            print("Motorcycle's FuelType                    : \(fuelType)")
            print("Motorcycle's RatePerDay                  : \(ratePerDay.currency())")
            print("Motorcycle's ratePerKm                   : \(ratePerKm.currency())")

        }
}


