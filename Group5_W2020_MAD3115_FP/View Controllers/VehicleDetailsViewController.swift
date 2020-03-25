//
//  VehicleDetailsViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-18.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class VehicleDetailsViewController: UIViewController {
    
    @IBOutlet weak var tblDriver: UITableView!
    
    var person : Person?
    
    var previousVC : String?
    var vehicle : Vehicle?
    var vehicleRent : VehicleRent?

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
    
    @IBOutlet weak var lblRentDetails: UILabel!
    @IBOutlet weak var lblRentStartDate: UILabel!
    @IBOutlet weak var lblRentEndDate: UILabel!
    @IBOutlet weak var lblRentInDays: UILabel!
    @IBOutlet weak var lblNoOfKm: UILabel!
    @IBOutlet weak var lblRentInKm: UILabel!
    
    @IBOutlet weak var lblDriver: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bbVehicle = UIBarButtonItem(title: "Delete Vehicle", style: .plain, target: self, action: #selector(remove))
        navigationItem.rightBarButtonItem = bbVehicle
        
        display()
    }
    
    @objc func remove(){
        
        if previousVC == "Owner"{
            let owner = person as! Owner
            if vehicle?.type == "Car"{
                let car = vehicle as! Car
                owner.removeVehicleOwned(vehicleIdentificationNumber: car.identificationNumber)
                navigationController?.popViewController(animated: true)
            } else if vehicle?.type == "Bus"{
                let bus = vehicle as! Bus
                owner.removeVehicleOwned(vehicleIdentificationNumber: bus.identificationNumber)
                navigationController?.popViewController(animated: true)
            } else{
                let motorcycle = vehicle as! MotorCycle
                owner.removeVehicleOwned(vehicleIdentificationNumber: motorcycle.identificationNumber)
                navigationController?.popViewController(animated: true)
            }
        }
//        else{
//            let customer = person as! Customer
//            customer.removeVehicleRent(vehicleRentID: vehicleRent!.vehicleRentID)
//        }
        
//        if vehicle?.type == "Car"{
//            let car = vehicle as! Car
//            DataStorage.getInstance().removeVehicle(vehicle: Car(identificationNumber: car.identificationNumber, description: car.description, isSelfDrive: car.isSelfDrive, manufacturerName: car.manufacturerName, isInsured: car.isInsured, insuranceProviderName: car.insuranceProviderName, vehicleNoOfSeats: car.vehicleNoOfSeats, fuelType: car.fuelType, ratePerDay: car.ratePerDay, ratePerKm: car.ratePerKm, carColor: car.carColor, carType: car.carType, driver: car.driver))
//            navigationController?.popViewController(animated: true)
//        }
//            else if vehicle?.type == "Bus"{
//            let bus = vehicle as! Bus
//            DataStorage.getInstance().removeVehicle(vehicle: Bus(identificationNumber: bus.identificationNumber, description: bus.description, isSelfDrive: bus.isSelfDrive, manufacturerName: bus.manufacturerName, isInsured: bus.isInsured, vehicleNoOfSeats: bus.vehicleNoOfSeats, insuranceProviderName: bus.insuranceProviderName, fuelType: bus.fuelType, ratePerDay: bus.ratePerDay, ratePerKm: bus.ratePerKm, busType: bus.busType, iswifiAvailable: bus.iswifiAvailable, isAccessibiltyServiceAvailable: bus.isAccessibiltyServiceAvailable, driver: bus.driver))
//            navigationController?.popViewController(animated: true)
//        }else{
//            let motorcycle = vehicle as! MotorCycle
//            DataStorage.getInstance().removeVehicle(vehicle: MotorCycle(identificationNumber: motorcycle.identificationNumber, description: motorcycle.description, manufacturerName: motorcycle.manufacturerName, isSelfDrive: motorcycle.isSelfDrive, isInsured: motorcycle.isInsured, insuranceProviderName: motorcycle.insuranceProviderName, vehicleNoOfSeats: motorcycle.vehicleNoOfSeats, fuelType: motorcycle.fuelType, ratePerDay: motorcycle.ratePerDay, ratePerKm: motorcycle.ratePerKm, maxTopSpeed: motorcycle.maxTopSpeed, milage: motorcycle.milage))
//            navigationController?.popViewController(animated: true)
//        }
    }
    
    func display(){
            if vehicle?.type == "Car"{
            lblDetail4.text = "Car's Details"
            let car = vehicle as! Car
            lblIdNo.text = "Identification Number           :  \(car.identificationNumber)"
            lblDescription.text = "Description                            :  \(car.description)"
            lblSelfDrive.text = "Is Self Drive?                         :  \(car.isSelfDrive)"
            lblManufacturer.text = "Manufacturer's Name          :  \(car.manufacturerName)"
            lblInsured.text = "Is Insured?                             :  \(car.isInsured)"
            lblSeats.text = "Number of Seats                  :  \(car.vehicleNoOfSeats)"
            lblInsuranceProvider.text = "Insurance Provider's Name :  \(car.insuranceProviderName)"
            lblFuelType.text = "Fuel Type                               :  \(car.fuelType)"
            lblRatePerDay.text = "Rate Per Day                         :  \(car.ratePerDay.currency())"
            lblRatePerKm.text = "Rate Per KM                          :  \(car.ratePerKm.currency())"
            lblDetail1.text = "Car Type                                :  \(car.carType)"
            lblDetail2.text = "Car Color                               :  \(car.carColor)"
                lblDriver.text = "Driver Details"
//                if car.driver != nil{
//                    lblDriver.text = "\(car.driver.fullName)"
//                }
            if previousVC == "customer" {
                lblRentDetails.text = "Car Rent Details"
                lblRentStartDate.text = "Rent Start Date                      :  \(vehicleRent!.rentStartDate.evaluateDate())"
                lblRentEndDate.text = "Rent End Date                        :  \(vehicleRent!.rentEndDate.evaluateDate())"
                lblRentInDays.text = "Rent in Number of Days        :  \(vehicleRent!.rentInNumberOfDays.currency())"
                lblNoOfKm.text = "Number of KM Drived           :  \(vehicleRent!.numberOfKmDrived)"
                lblRentInKm.text = "Rent in Number of KM           :  \(vehicleRent!.rentInKm.currency())"
            }
                
        }else if vehicle?.type == "Motorcycle"{
            lblDetail4.text = "Motorcycle's Details"
            let motorcycle = vehicle as! MotorCycle
            lblIdNo.text = "Identification Number           :  \(motorcycle.identificationNumber)"
            lblDescription.text = "Description                            :  \(motorcycle.description)"
            lblSelfDrive.text = "Is Self Drive?                         :  \(motorcycle.isSelfDrive)"
            lblManufacturer.text = "Manufacturer's Name          :  \(motorcycle.manufacturerName)"
            lblInsured.text = "Is Insured?                             :  \(motorcycle.isInsured)"
            lblSeats.text = "Number of Seats                  :  \(motorcycle.vehicleNoOfSeats)"
            lblInsuranceProvider.text = "Insurance Provider's Name :  \(motorcycle.insuranceProviderName)"
            lblFuelType.text = "Fuel Type                               :  \(motorcycle.fuelType)"
            lblRatePerDay.text = "Rate Per Day                         :  \(motorcycle.ratePerDay.currency())"
            lblRatePerKm.text = "Rate Per KM                          :  \(motorcycle.ratePerKm.currency())"
            lblDetail1.text = "Max Top Speed                    : \(motorcycle.maxTopSpeed)"
            lblDetail2.text = "Milage                                   : \(motorcycle.milage)"
                lblDriver.text = "Driver Details"
            if previousVC == "customer" {
                lblRentDetails.text = "Motorcycle Rent Details"
                lblRentStartDate.text = "Rent Start Date                      :  \(vehicleRent!.rentStartDate.evaluateDate())"
                lblRentEndDate.text = "Rent End Date                        :  \(vehicleRent!.rentEndDate.evaluateDate())"
                lblRentInDays.text = "Rent in Number of Days        :  \(vehicleRent!.rentInNumberOfDays.currency())"
                lblNoOfKm.text = "Number of KM Drived           :  \(vehicleRent!.numberOfKmDrived)"
                lblRentInKm.text = "Rent in Number of KM           :  \(vehicleRent!.rentInKm.currency())"
            }
        }else{
            lblDetail4.text = "Bus's Details"
            let bus = vehicle as! Bus
            lblIdNo.text = "Identification Number          :  \(bus.identificationNumber)"
            lblDescription.text = "Description                            :  \(bus.description)"
            lblSelfDrive.text = "Is Self Drive?                         :  \(bus.isSelfDrive)"
            lblManufacturer.text = "Manufacturer's Name          :  \(bus.manufacturerName)"
            lblInsured.text = "Is Insured?                             :  \(bus.isInsured)"
            lblSeats.text = "Number of Seats                  :  \(bus.vehicleNoOfSeats)"
            lblInsuranceProvider.text = "Insurance Provider's Name :  \(bus.insuranceProviderName)"
            lblFuelType.text = "Fuel Type                               :  \(bus.fuelType)"
            lblRatePerDay.text = "Rate Per Day                         :  \(bus.ratePerDay.currency())"
            lblRatePerKm.text = "Rate Per KM                          :  \(bus.ratePerKm.currency())"
            lblDetail1.text = "Type of Bus                           : \(bus.busType)"
            lblDetail2.text = "Is Accessibility Available?    : \(bus.isAccessibiltyServiceAvailable)"
            lblDetail3.text = "Is Wifi Available?                   : \(bus.iswifiAvailable)"
                lblDriver.text = "Bus's Driver"
//                if bus.driver != nil{
//                    lblDriver.text = "\(bus.driver.fullName)"
//                }
            if previousVC == "customer" {
                lblRentDetails.text = "Bus Rent Details"
                lblRentStartDate.text = "Rent Start Date                    :  \(vehicleRent!.rentStartDate.evaluateDate())"
                lblRentEndDate.text = "Rent End Date                      :  \(vehicleRent!.rentEndDate.evaluateDate())"
                lblRentInDays.text = "Rent in Number of Days      :  \(vehicleRent!.rentInNumberOfDays.currency())"
                lblNoOfKm.text = "Number of KM Drived          :  \(vehicleRent!.numberOfKmDrived)"
                lblRentInKm.text = "Rent in Number of KM         :  \(vehicleRent!.rentInKm.currency())"
            }
        }
    }
}

extension VehicleDetailsViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell")
    
        if vehicle?.type == "Car"{
            let car = vehicle as! Car
//            if car.driver != nil {
                cell?.textLabel?.text = "Driver's Name : \(car.driver.fullName)"
//            }else{
//                cell?.textLabel?.text = "This Vehicle Doesn't have a driver"
//            }
        } else if vehicle?.type == "Bus"{
            let bus = vehicle as! Bus
//            if bus.driver != nil{
                cell?.textLabel?.text = "Driver's Name : \(bus.driver.fullName)"
//            }else{
//                cell?.textLabel?.text = "This Vehicle Doesn't have a driver"
//            }
        }else{
            cell?.textLabel?.text = "This Vehicle Doesn't have a driver"
        }
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if vehicle?.type == "Car"{
            let car = vehicle as! Car
            let sc = car.driver
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let driverDetailsViewController = sb.instantiateViewController(identifier: "DriverDetailsViewController") as! DriverDetailsViewController
            driverDetailsViewController.driver = sc
            self.navigationController?.pushViewController(driverDetailsViewController, animated: true)
        }else if vehicle?.type == "Bus"{
            let bus = vehicle as! Bus
            let sc = bus.driver
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let driverDetailsViewController = sb.instantiateViewController(identifier: "DriverDetailsViewController") as! DriverDetailsViewController
            driverDetailsViewController.driver = sc
            self.navigationController?.pushViewController(driverDetailsViewController, animated: true)
        }else{
            let alertController = UIAlertController(title: "Empty", message: "No Driver Exists for this Vehicle", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
