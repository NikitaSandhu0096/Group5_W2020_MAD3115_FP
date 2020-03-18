//
//  DataStorage.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-18.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import Foundation

class DataStorage{
    private static let instance = DataStorage()
    private lazy var customerDictionary = [Int : Customer]()
    private lazy var ownerDictionary = [Int : Owner]()
    
    private init(){}
    
    static func getInstance() -> DataStorage{
        return instance
    }
    
    func addPerson(customer : Customer){
        let cid = customer.id
        self.customerDictionary.updateValue(customer, forKey: cid)
    }
    
    func addOwner(owner : Owner) {
        let oid = owner.id
        self.ownerDictionary.updateValue(owner, forKey: oid)
    }
    
    func loadPersonDetails(){
        // Customer objects
        let customer1 = Customer(id: 1, firstName: "Nikita", lastName: "Sandhu", gender: .Female, birthDate: "13/10/1994", mobileNumber: "3647912580", email: "nsandhu@gmail.com", userName: "nsandhu", password: "Nsandhu94".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "159, Yorkland Blvd", city: "Toronto")
        let customer2 = Customer(id: 2, firstName: "Kamalpreet", lastName: "Kaur", gender: .Female, birthDate: "20/02/1998", mobileNumber: "4561589875", email: "kamalpreet34@gmail.com", userName: "kamalkaur", password: "kaur98".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt",address: "234, Speedwell Street", city: "Brampton")
        let customer3 = Customer(id: 3, firstName: "Jyothi", lastName: "Thomas", gender: .Male, birthDate: "5/09/1990", mobileNumber: "4574359876", email: "jyotit123@gmail.com", userName: "jyotithomas", password: "thomas12".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "123, Shepherd Ave", city: "Scorbrough")
        let customer4 = Customer(id: 4, firstName: "Avni", lastName: "Patel", gender: .Female, birthDate: "27/02/1992", mobileNumber: "7892584598", email: "avniPatel@yahoo.com", userName: "AvniPAtel", password: "patel92".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "456, Yonge Street", city: "Toronto")
        let customer5 = Customer(id: 5, firstName: "Charmi", lastName: "Patel", gender: .Female, birthDate: "25/11/1993", mobileNumber: "6572583587", email: "patelCharmi34@outlook.com", userName: "charmi89", password: "charmi".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "4070, Square One", city: "Missisauga")
        
        // Driver objects
        let driver1 = Driver(id: 1, firstName: "Vel", lastName: "Ratan", gender: .Male, birthDate: "14/11/1995", mobileNumber: "2546572334", email: "ratvel234@out.com", userName: "retvel21", password: "dster543", drivingLicenseNumber: "C02358-0986-5609", isDrivingHistoryCleared: true, salary: 1000)

        let driver2 = Driver(id: 02, firstName: "Kartik", lastName: "Sharma", gender: .Male, birthDate: "12/06/1992", mobileNumber: "4562583579", email: "kartik34@yahoo.com", userName: "Skartik", password: "kartik".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C01147-9875-4598", isDrivingHistoryCleared: true, salary: 500)
        let driver3 = Driver(id: 03, firstName: "Markham", lastName: "Ellacot", gender: .Male, birthDate: "04/01/1993", mobileNumber: "6583249856", email: "Merel93@yahoo.com", userName: "merel", password: "Ellocat".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C0987-5289-3412", isDrivingHistoryCleared: true, salary: 640)
        let driver4 = Driver(id: 04, firstName: "Pritam", lastName: "Singh", gender: .Male, birthDate: "12/12/1995", mobileNumber: "9872571257", email: "singhpritam@outlook.com", userName: "pritamS", password: "Singh".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C0451-7157-6825", isDrivingHistoryCleared: true, salary: 800)
        let driver5 = Driver(id: 05, firstName: "Jasmine", lastName: "sharma", gender: .Female, birthDate: "07/09/1990", mobileNumber: "6579246574", email: "jasmins36@gmail.com", userName: "sharmaJas", password: "jasmine".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C0983-6754-3421", isDrivingHistoryCleared: true, salary: 1000)
        
        // Bus objects
        let bus1 = Bus(identificationNumber: "B01", description: "JBL enabled",isSelfDrive: false, manufacturerName: "Benz", isInsured: true, vehicleNoOfSeats: 20, insuranceProviderName: "Orient", fuelType: "Diesel", ratePerDay: 20, ratePerKm: 3, busType: "Volvo", iswifiAvailable: true, isAccessibiltyServiceAvailable: true)
        if (bus1.isSelfDrive == false){
            bus1.addDriver(drivers: driver1, driverId: driver1.id)
        }
        let bus2 = Bus(identificationNumber: "B02", description: "Customer-focused bifurcated group ware", isSelfDrive: false, manufacturerName: "Mercedes", isInsured: true, vehicleNoOfSeats: 24, insuranceProviderName: "TruSheild", fuelType: "Diesel", ratePerDay: 10 , ratePerKm: 2, busType: "Double Decker", iswifiAvailable: true, isAccessibiltyServiceAvailable: true)
        if (bus2.isSelfDrive == false){
            bus2.addDriver(drivers: driver2, driverId: driver2.id)
        }
        let bus3 = Bus(identificationNumber: "B03", description: "Focused actuating help-desk", isSelfDrive: false, manufacturerName: "Benz", isInsured: true, vehicleNoOfSeats: 18, insuranceProviderName:"Peter",  fuelType: "Diesel", ratePerDay: 15, ratePerKm: 4.5, busType: "diesel", iswifiAvailable: false, isAccessibiltyServiceAvailable: true)
        if (bus3.isSelfDrive == false){
            bus3.addDriver(drivers: driver3, driverId: driver3.id)
        }
        let bus4 = Bus(identificationNumber: "B04", description: "Customer-focused bifurcated", isSelfDrive: false, manufacturerName: "Mercedes", isInsured: true, vehicleNoOfSeats: 45, insuranceProviderName: "MR.Yonge",  fuelType: "Diesel", ratePerDay: 30, ratePerKm: 5, busType: "School Bus", iswifiAvailable: false, isAccessibiltyServiceAvailable: true)
        if (bus4.isSelfDrive == false){
            bus4.addDriver(drivers: driver4, driverId: driver4.id)
        }
        let bus5 = Bus(identificationNumber: "B05", description: "Customer-focused bifurcated", isSelfDrive: false, manufacturerName: "Benz", isInsured: true, vehicleNoOfSeats: 20, insuranceProviderName: "Orient", fuelType: "Diesel", ratePerDay: 22, ratePerKm: 5, busType: "City Transit", iswifiAvailable: true, isAccessibiltyServiceAvailable: false)
        if (bus5.isSelfDrive == false){
            bus5.addDriver(drivers: driver5, driverId: driver5.id)
        }
        
        // Car objects
        let car1 = Car(identificationNumber: "C01", description: "Sedan", isSelfDrive: false, manufacturerName: "Polo", isInsured: true, insuranceProviderName: "National", vehicleNoOfSeats: 4, fuelType: "Petrol", ratePerDay: 10, ratePerKm: 5, carColor: "White", carType: "Sedan")
        if (car1.isSelfDrive == false){
            car1.addDriver(drivers: driver1, driverId: driver1.id)
        }
        let car2 = Car(identificationNumber: "C02", description: "SUV", isSelfDrive: true, manufacturerName: "Mahindra", isInsured: true, insuranceProviderName: "Thomas", vehicleNoOfSeats: 5, fuelType: "Petrol", ratePerDay: 12, ratePerKm: 3 , carColor: "Black", carType: "HatchBack")
        if (car2.isSelfDrive == false){
            car2.addDriver(drivers: driver2, driverId: driver2.id)
        }
        let car3 = Car(identificationNumber: "C03", description: "Crossover", isSelfDrive: true, manufacturerName: "Nissan", isInsured: true, insuranceProviderName: "Car Insaurance", vehicleNoOfSeats: 7, fuelType: "Diesel", ratePerDay: 15, ratePerKm: 5, carColor: "White", carType: "CUV")
        if (car3.isSelfDrive == false){
            car3.addDriver(drivers: driver3, driverId: driver3.id)
        }
        let car4 = Car(identificationNumber: "C04", description: "Convertible and Crossover", isSelfDrive: true, manufacturerName: "Lamborghini", isInsured: true, insuranceProviderName: "Convertible Insaurances", vehicleNoOfSeats: 2, fuelType: "Diesel", ratePerDay: 30, ratePerKm: 8, carColor: "Red", carType: "Convertible")
        if (car4.isSelfDrive == false){
            car4.addDriver(drivers: driver4, driverId: driver4.id)
        }
        let car5 = Car(identificationNumber: "C05", description: "Mercedes Benz GLE Coupe", isSelfDrive: true, manufacturerName: "Mercedes", isInsured: true, insuranceProviderName: "National", vehicleNoOfSeats: 5, fuelType: "Diesel", ratePerDay: 30, ratePerKm: 5, carColor: "White", carType: "Passenger Car")
        if (car5.isSelfDrive == false){
            car5.addDriver(drivers: driver5, driverId: driver5.id)
        }
        
        // Motorcycle objects
        let motorcycle1 = MotorCycle(identificationNumber: "MC01", description: "Classic",manufacturerName: "Bajaj", isSelfDrive: true, isInsured: true,  insuranceProviderName: "Overseas",vehicleNoOfSeats: 2,fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 60, milage: 25)
        let motorcycle2 = MotorCycle(identificationNumber: "MC02", description: "Thunderbird",manufacturerName: "Bullet",isSelfDrive: true,  isInsured: true, insuranceProviderName: "Nation", vehicleNoOfSeats: 2, fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 50, milage: 35)
        let motorcycle3 = MotorCycle(identificationNumber: "MC03", description: "Chronic", manufacturerName: "Yamaha", isSelfDrive: true, isInsured: true, insuranceProviderName: "Oriental", vehicleNoOfSeats: 2,  fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 40, milage: 40)
        let motorcycle4 = MotorCycle(identificationNumber: "MC04", description: "Chrome", manufacturerName: "Pulsar", isSelfDrive: true, isInsured: true, insuranceProviderName: "Hero", vehicleNoOfSeats: 2,  fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 70, milage: 25)
        let motorcycle5 = MotorCycle(identificationNumber: "MC05", description: "Classic", manufacturerName: "Honda", isSelfDrive: true, isInsured: true, insuranceProviderName: "Philo", vehicleNoOfSeats: 2,  fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 60, milage: 55)
        
        // Owner objects
        let owner1 = Owner(id: 1, firstName: "Nikita", lastName: "Sandhu", gender: .Female, birthDate: "13/10/1994", mobileNumber: "1234567890", email: "nsandhu@gmail.com", userName: "nsandhu", password: "safsdf".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt" , companyTitle: "tmall", businessLandLineNumber: "657498", website: "tmall.com")
        let owner2 = Owner(id: 2, firstName: "Kamalpreet", lastName: "kaur", gender: .Female, birthDate: "20/02/1998", mobileNumber: "4573681257", email: "kamalKaur@gmail.com", userName: "kamalKaur", password: "kaur".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", companyTitle: "nature", businessLandLineNumber: "112642", website: "nature.com")
        let owner3 = Owner(id: 3, firstName: "Jyoti", lastName: "Thomas", gender: .Female, birthDate: "03/10/1990", mobileNumber: "4569872457", email: "Jthomas@yahoo.com", userName: "jyotiT", password: "thomas".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", companyTitle: "twitterbeat", businessLandLineNumber: "235987", website: "macromedia.com")
        let owner4 = Owner(id: 4, firstName: "Millind", lastName: "Gaba", gender: .Male, birthDate: "08/04/1992", mobileNumber: "3419871547", email: "millind67@gmail.com", userName: "Gmillind", password: "gaba".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", companyTitle: "Rooxo", businessLandLineNumber: "123455", website: "tmall.com")
        let owner5 = Owner(id: 5, firstName: "Charmi", lastName: "Patel", gender: .Female, birthDate: "03/11/1993", mobileNumber: "6584237485", email: "charmi12@outlook.com", userName: "charmiPatel", password: "patel".encrypt(key: "encrypt", iv: "encrypt") ??
            "encrypt", companyTitle: "Multimedia", businessLandLineNumber: "658494", website: "multimedia.com")
        
        // Adding vehicle rent to each vehicles
        let rent1 = VehicleRent(vehicleRentID: 1, rentStartDate: "01/01/20", rentEndDate: "06/01/20", numberOfKmDrived: 20)
        rent1.addVehicle(vehicle: bus1, identificationNumber: bus1.identificationNumber)

        let rent2 = VehicleRent(vehicleRentID: 2, rentStartDate: "05/02/19", rentEndDate: "10/02/19", numberOfKmDrived: 40)

        rent2.addVehicle(vehicle: car1, identificationNumber: car1.identificationNumber)

        let rent3 = VehicleRent(vehicleRentID: 3, rentStartDate: "08/05/18", rentEndDate: "08/08/18", numberOfKmDrived: 200)
        rent3.addVehicle(vehicle: bus2, identificationNumber: bus2.identificationNumber)

        let rent4 = VehicleRent(vehicleRentID: 4, rentStartDate: "09/01/19", rentEndDate: "30/01/19", numberOfKmDrived: 140)
        rent4.addVehicle(vehicle: motorcycle2, identificationNumber: motorcycle2.identificationNumber)

        let rent5 = VehicleRent(vehicleRentID: 5, rentStartDate: "10/10/19", rentEndDate: "1/12/19", numberOfKmDrived: 310)
        rent5.addVehicle(vehicle: car4, identificationNumber: car4.identificationNumber)
        
        // Adding Owner's vehicle list
        owner1.addVehicleOwned(vehicleOwned: car1, vehicleIdentificationNumber: car1.identificationNumber)
        owner1.addVehicleOwned(vehicleOwned: bus1, vehicleIdentificationNumber: bus1.identificationNumber)
        owner1.addVehicleOwned(vehicleOwned: car2, vehicleIdentificationNumber: car2.identificationNumber)

        owner2.addVehicleOwned(vehicleOwned: motorcycle1, vehicleIdentificationNumber: motorcycle1.identificationNumber)
        owner2.addVehicleOwned(vehicleOwned: bus2, vehicleIdentificationNumber: bus2.identificationNumber)
        owner2.addVehicleOwned(vehicleOwned: car3, vehicleIdentificationNumber: car3.identificationNumber)

        owner3.addVehicleOwned(vehicleOwned: car4, vehicleIdentificationNumber: car4.identificationNumber)
        owner3.addVehicleOwned(vehicleOwned: car5, vehicleIdentificationNumber: car5.identificationNumber)

        owner4.addVehicleOwned(vehicleOwned: bus3, vehicleIdentificationNumber: bus3.identificationNumber)
        owner4.addVehicleOwned(vehicleOwned: bus4, vehicleIdentificationNumber: bus4.identificationNumber)
        owner4.addVehicleOwned(vehicleOwned: bus5, vehicleIdentificationNumber: bus5.identificationNumber)

        owner5.addVehicleOwned(vehicleOwned: motorcycle2, vehicleIdentificationNumber: motorcycle2.identificationNumber)
        owner5.addVehicleOwned(vehicleOwned: motorcycle3, vehicleIdentificationNumber: motorcycle3.identificationNumber)
        owner5.addVehicleOwned(vehicleOwned: motorcycle4, vehicleIdentificationNumber: motorcycle4.identificationNumber)
        owner5.addVehicleOwned(vehicleOwned: motorcycle5, vehicleIdentificationNumber: motorcycle5.identificationNumber)
        
        customer1.addVehicleRent(vehicleRent: rent1, vehicleRentID: rent1.vehicleRentID)
        customer1.addVehicleRent(vehicleRent: rent2, vehicleRentID: rent2.vehicleRentID)

        customer2.addVehicleRent(vehicleRent: rent2, vehicleRentID: rent3.vehicleRentID)

        customer3.addVehicleRent(vehicleRent: rent3, vehicleRentID: rent3.vehicleRentID)
        customer3.addVehicleRent(vehicleRent: rent4, vehicleRentID: rent4.vehicleRentID)

        customer4.addVehicleRent(vehicleRent: rent4, vehicleRentID: rent5.vehicleRentID)
        
        customer5.addVehicleRent(vehicleRent: rent5, vehicleRentID: rent5.vehicleRentID)

        addPerson(customer: customer1)
        addPerson(customer: customer2)
        addPerson(customer: customer3)
        addPerson(customer: customer4)
        addPerson(customer: customer5)
        
        addOwner(owner: owner1)
        addOwner(owner: owner2)
        addOwner(owner: owner3)
        addOwner(owner: owner4)
        addOwner(owner: owner5)
    }
        
    func getAllCustomer() -> [Person]{
        var customerList : [Person] = []
        for i in customerDictionary{
            customerList.append(i.value)
        }
        return customerList
    }
    
    func getAllOwners() -> [Person]{
        var ownerList : [Person] = []
        for j in ownerDictionary{
            ownerList.append(j.value)
        }
        return ownerList
    }
}
