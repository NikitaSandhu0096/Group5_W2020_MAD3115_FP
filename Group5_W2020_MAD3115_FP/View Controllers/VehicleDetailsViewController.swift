//
//  VehicleDetailsViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-18.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class VehicleDetailsViewController: UIViewController {
    
    var vehicle : Vehicle?

    @IBOutlet weak var lblIdNo: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblSelfDrive: UILabel!
    @IBOutlet weak var lblManufacturer: UILabel!
    @IBOutlet weak var lblInsured: UILabel!
    @IBOutlet weak var lblSeats: UILabel!
    @IBOutlet weak var lblInsuranceProvider: UILabel!
    @IBOutlet weak var lblFuelType: UILabel!
    @IBOutlet weak var lblRatePerDay: UILabel!
    @IBOutlet weak var lblRatePerKm: UILabel!
    @IBOutlet weak var lblDetail1: UILabel!
    @IBOutlet weak var lblDetail2: UILabel!
    @IBOutlet weak var lblDetail3: UILabel!
    @IBOutlet weak var lblDetail4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func display(){
        if vehicle?.type == "Car"{
            lblDetail4.text = "Car's Details"
            let car = vehicle as! Car
            lblIdNo.text = "Identification Number : \(car.identificationNumber)"
            lblDescription.text = "Description : \(car.description)"
            lblSelfDrive.text = "Is Self Drive? : \(car.isSelfDrive)"
            lblManufacturer.text = "Manufacturer's Name : \(car.manufacturerName)"
            lblInsured.text = "Is Insured? : \(car.isInsured)"
            lblSeats.text = "Number of Seats : \(car.vehicleNoOfSeats)"
            lblInsuranceProvider.text = "Insurance Provider's Name : \(car.insuranceProviderName)"
            lblFuelType.text = "Fuel Type : \(car.fuelType)"
            lblRatePerDay.text = "Rate Per Day : \(car.ratePerDay)"
            lblRatePerKm.text = "Rate Per KM : \(car.ratePerKm)"
            lblDetail1.text = "Car Type : \(car.carType)"
            lblDetail2.text = "Car Color : \(car.carColor)"
        }else if vehicle?.type == "Motorcycle"{
            lblDetail4.text = "Motorcycle's Details"
            let motorcycle = vehicle as! MotorCycle
            lblIdNo.text = "Identification Number : \(motorcycle.identificationNumber)"
            lblDescription.text = "Description : \(motorcycle.description)"
            lblSelfDrive.text = "Is Self Drive? : \(motorcycle.isSelfDrive)"
            lblManufacturer.text = "Manufacturer's Name : \(motorcycle.manufacturerName)"
            lblInsured.text = "Is Insured? : \(motorcycle.isInsured)"
            lblSeats.text = "Number of Seats : \(motorcycle.vehicleNoOfSeats)"
            lblInsuranceProvider.text = "Insurance Provider's Name : \(motorcycle.insuranceProviderName)"
            lblFuelType.text = "Fuel Type : \(motorcycle.fuelType)"
            lblRatePerDay.text = "Rate Per Day : \(motorcycle.ratePerDay)"
            lblRatePerKm.text = "Rate Per KM : \(motorcycle.ratePerKm)"
            lblDetail1.text = "Max Top Speed : \(motorcycle.maxTopSpeed)"
            lblDetail2.text = "Milage : \(motorcycle.milage)"
        }else{
            lblDetail4.text = "Bus's Details"
            let bus = vehicle as! Bus
            lblIdNo.text = "Identification Number : \(bus.identificationNumber)"
            lblDescription.text = "Description : \(bus.description)"
            lblSelfDrive.text = "Is Self Drive? : \(bus.isSelfDrive)"
            lblManufacturer.text = "Manufacturer's Name : \(bus.manufacturerName)"
            lblInsured.text = "Is Insured? : \(bus.isInsured)"
            lblSeats.text = "Number of Seats : \(bus.vehicleNoOfSeats)"
            lblInsuranceProvider.text = "Insurance Provider's Name : \(bus.insuranceProviderName)"
            lblFuelType.text = "Fuel Type : \(bus.fuelType)"
            lblRatePerDay.text = "Rate Per Day : \(bus.ratePerDay)"
            lblRatePerKm.text = "Rate Per KM : \(bus.ratePerKm)"
            lblDetail1.text = "Type of Bus : \(bus.busType)"
            lblDetail2.text = "Is Accessibility Service Available? : \(bus.isAccessibiltyServiceAvailable)"
            lblDetail3.text = "Is Wifi Available : \(bus.iswifiAvailable)"
        }
    }
}
