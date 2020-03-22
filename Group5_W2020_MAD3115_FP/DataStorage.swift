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
    
    func addCustomer(customer : Customer){
        let cid = customer.id
        self.customerDictionary.updateValue(customer, forKey: cid)
    }
    
    func addOwner(owner : Owner) {
        let oid = owner.id
        self.ownerDictionary.updateValue(owner, forKey: oid)
    }
    
    func loadPersonDetails(){
        // Customer objects
        let customer1 = Customer(id: 1, firstName: "Nikita", lastName: "Sandhu", gender: "Female", birthDate: "Oct 13, 1994", mobileNumber: "3647912580", email: "nsandhu@gmail.com", userName: "nsandhu", password: "Nsandhu94".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "159, Yorkland Blvd", city: "Toronto")
        let customer2 = Customer(id: 2, firstName: "Kamalpreet", lastName: "Kaur", gender: "Female", birthDate: "Feb 20, 1998", mobileNumber: "4561589875", email: "kamalpreet34@gmail.com", userName: "kamalkaur", password: "kaur98".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt",address: "234, Speedwell Street", city: "Brampton")
        let customer3 = Customer(id: 3, firstName: "Jyothi", lastName: "Thomas", gender: "Male", birthDate: "Sep 5, 1990", mobileNumber: "4574359876", email: "jyotit123@gmail.com", userName: "jyotithomas", password: "thomas12".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "123, Shepherd Ave", city: "Scorbrough")
        let customer4 = Customer(id: 4, firstName: "Avni", lastName: "Patel", gender: "Female", birthDate: "Feb 27, 1992", mobileNumber: "7892584598", email: "avniPatel@yahoo.com", userName: "AvniPAtel", password: "patel92".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "456, Yonge Street", city: "Toronto")
        let customer5 = Customer(id: 5, firstName: "Charmi", lastName: "Patel", gender: "Female", birthDate: "Nov 25, 1993", mobileNumber: "6572583587", email: "patelCharmi34@outlook.com", userName: "charmi89", password: "charmi".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", address: "4070, Square One", city: "Missisauga")
        
        // Driver objects
        let driver1 = Driver(id: 1, firstName: "Vel", lastName: "Ratan", gender: "Male", birthDate: "Nov 14, 1995", mobileNumber: "2546572334", email: "ratvel234@out.com", userName: "retvel21", password: "dster543", drivingLicenseNumber: "C02358-0986-5609", isDrivingHistoryCleared: true, salary: 1000)

        let driver2 = Driver(id: 02, firstName: "Kartik", lastName: "Sharma", gender: "Male", birthDate: "Jun 12, 1992", mobileNumber: "4562583579", email: "kartik34@yahoo.com", userName: "Skartik", password: "kartik".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C01147-9875-4598", isDrivingHistoryCleared: true, salary: 500)
        let driver3 = Driver(id: 03, firstName: "Markham", lastName: "Ellacot", gender: "Male", birthDate: "Jan 04, 1993", mobileNumber: "6583249856", email: "Merel93@yahoo.com", userName: "merel", password: "Ellocat".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C0987-5289-3412", isDrivingHistoryCleared: true, salary: 640)
        let driver4 = Driver(id: 04, firstName: "Pritam", lastName: "Singh", gender: "Male", birthDate: "Dec 12, 1995", mobileNumber: "9872571257", email: "singhpritam@outlook.com", userName: "pritamS", password: "Singh".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C0451-7157-6825", isDrivingHistoryCleared: true, salary: 800)
        let driver5 = Driver(id: 05, firstName: "Jasmine", lastName: "sharma", gender: "Female", birthDate: "Sep 07, 1990", mobileNumber: "6579246574", email: "jasmins36@gmail.com", userName: "sharmaJas", password: "jasmine".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: "C0983-6754-3421", isDrivingHistoryCleared: true, salary: 1000)
        
        // Bus objects
        let bus1 = Bus(identificationNumber: "B01", description: "Ford Transit",isSelfDrive: false, manufacturerName: "Ford", isInsured: true, vehicleNoOfSeats: 20, insuranceProviderName: "Orient", fuelType: "Diesel", ratePerDay: 20, ratePerKm: 3, busType: "Volvo", iswifiAvailable: true, isAccessibiltyServiceAvailable: true, driver: driver1)
//        if (bus1.isSelfDrive == false){
//            bus1.addDriver(drivers: driver1, driverId: driver1.id)
//        }
        let bus2 = Bus(identificationNumber: "B02", description: "Mercedes-Benz Sprinter", isSelfDrive: false, manufacturerName: "Mercedes", isInsured: true, vehicleNoOfSeats: 24, insuranceProviderName: "TruSheild", fuelType: "Diesel", ratePerDay: 10 , ratePerKm: 2, busType: "Double Decker", iswifiAvailable: true, isAccessibiltyServiceAvailable: true, driver: driver2)
//        if (bus2.isSelfDrive == false){
//            bus2.addDriver(drivers: driver2, driverId: driver2.id)
//        }
        let bus3 = Bus(identificationNumber: "B03", description: "Hyundai Starex", isSelfDrive: false, manufacturerName: "Hyundai", isInsured: true, vehicleNoOfSeats: 18, insuranceProviderName:"Peter",  fuelType: "Diesel", ratePerDay: 15, ratePerKm: 4.5, busType: "Mini Bus", iswifiAvailable: false, isAccessibiltyServiceAvailable: true, driver: driver3)
//        if (bus3.isSelfDrive == false){
//            bus3.addDriver(drivers: driver3, driverId: driver3.id)
//        }
        let bus4 = Bus(identificationNumber: "B04", description: "Renault Master", isSelfDrive: false, manufacturerName: "Renault", isInsured: true, vehicleNoOfSeats: 45, insuranceProviderName: "MR.Yonge",  fuelType: "Diesel", ratePerDay: 30, ratePerKm: 5, busType: "School Bus", iswifiAvailable: false, isAccessibiltyServiceAvailable: true, driver: driver4)
//        if (bus4.isSelfDrive == false){
//            bus4.addDriver(drivers: driver4, driverId: driver4.id)
//        }
        let bus5 = Bus(identificationNumber: "B05", description: "Toyota Hiace", isSelfDrive: false, manufacturerName: "Toyota", isInsured: true, vehicleNoOfSeats: 20, insuranceProviderName: "Orient", fuelType: "Diesel", ratePerDay: 22, ratePerKm: 5, busType: "City Transit", iswifiAvailable: true, isAccessibiltyServiceAvailable: false, driver: driver5)
//        if (bus5.isSelfDrive == false){
//            bus5.addDriver(drivers: driver5, driverId: driver5.id)
//        }
        
        // Car objects
        let car1 = Car(identificationNumber: "C01", description: "Sedan", isSelfDrive: false, manufacturerName: "Polo", isInsured: true, insuranceProviderName: "National", vehicleNoOfSeats: 4, fuelType: "Petrol", ratePerDay: 10, ratePerKm: 5, carColor: "White", carType: "Sedan", driver : driver1)
//        if (car1.isSelfDrive == false){
//            car1.addDriver(drivers: driver1, driverId: driver1.id)
//        }
        let car2 = Car(identificationNumber: "C02", description: "SUV", isSelfDrive: true, manufacturerName: "Mahindra", isInsured: true, insuranceProviderName: "Thomas", vehicleNoOfSeats: 5, fuelType: "Petrol", ratePerDay: 12, ratePerKm: 3 , carColor: "Black", carType: "HatchBack", driver : driver2)
//        if (car2.isSelfDrive == false){
//            car2.addDriver(drivers: driver2, driverId: driver2.id)
//        }
        let car3 = Car(identificationNumber: "C03", description: "Crossover", isSelfDrive: true, manufacturerName: "Nissan", isInsured: true, insuranceProviderName: "Car Insaurance", vehicleNoOfSeats: 7, fuelType: "Diesel", ratePerDay: 15, ratePerKm: 5, carColor: "White", carType: "CUV", driver: driver3)
//        if (car3.isSelfDrive == false){
//            car3.addDriver(drivers: driver3, driverId: driver3.id)
//        }
        let car4 = Car(identificationNumber: "C04", description: "Convertible and Crossover", isSelfDrive: true, manufacturerName: "Lamborghini", isInsured: true, insuranceProviderName: "Convertion Insurances", vehicleNoOfSeats: 2, fuelType: "Diesel", ratePerDay: 30, ratePerKm: 8, carColor: "Red", carType: "Convertible", driver: driver4)
//        if (car4.isSelfDrive == false){
//            car4.addDriver(drivers: driver4, driverId: driver4.id)
//        }
        let car5 = Car(identificationNumber: "C05", description: "Mercedes Benz GLE Class", isSelfDrive: true, manufacturerName: "Mercedes", isInsured: true, insuranceProviderName: "National", vehicleNoOfSeats: 5, fuelType: "Diesel", ratePerDay: 30, ratePerKm: 5, carColor: "White", carType: "Passenger Car", driver: driver5)
//        if (car5.isSelfDrive == false){
//            car5.addDriver(drivers: driver5, driverId: driver5.id)
//        }
        
        // Motorcycle objects
        let motorcycle1 = MotorCycle(identificationNumber: "MC01", description: "Classic",manufacturerName: "Bajaj", isSelfDrive: true, isInsured: true,  insuranceProviderName: "Overseas",vehicleNoOfSeats: 2,fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 60, milage: 25)
        let motorcycle2 = MotorCycle(identificationNumber: "MC02", description: "Thunderbird",manufacturerName: "Bullet",isSelfDrive: true,  isInsured: true, insuranceProviderName: "Nation", vehicleNoOfSeats: 2, fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 50, milage: 35)
        let motorcycle3 = MotorCycle(identificationNumber: "MC03", description: "Chronic", manufacturerName: "Yamaha", isSelfDrive: true, isInsured: true, insuranceProviderName: "Oriental", vehicleNoOfSeats: 2,  fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 40, milage: 40)
        let motorcycle4 = MotorCycle(identificationNumber: "MC04", description: "Chrome", manufacturerName: "Pulsar", isSelfDrive: true, isInsured: true, insuranceProviderName: "Hero", vehicleNoOfSeats: 2,  fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 70, milage: 25)
        let motorcycle5 = MotorCycle(identificationNumber: "MC05", description: "Classic", manufacturerName: "Honda", isSelfDrive: true, isInsured: true, insuranceProviderName: "Philo", vehicleNoOfSeats: 2,  fuelType: "Petrol", ratePerDay: 5, ratePerKm: 5, maxTopSpeed: 60, milage: 55)
        
        // Owner objects
        let owner1 = Owner(id: 1, firstName: "Nikita", lastName: "Sandhu", gender: "Female", birthDate: "Oct 13, 1994", mobileNumber: "1234567890", email: "nsandhu@gmail.com", userName: "nsandhu", password: "safsdf".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt" , companyTitle: "tmall", businessLandLineNumber: "657498", website: "tmall.com")
        let owner2 = Owner(id: 2, firstName: "Kamalpreet", lastName: "kaur", gender: "Female", birthDate: "Feb 20, 1998", mobileNumber: "4573681257", email: "kamalKaur@gmail.com", userName: "kamalKaur", password: "kaur".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", companyTitle: "nature", businessLandLineNumber: "112642", website: "nature.com")
        let owner3 = Owner(id: 3, firstName: "Jyoti", lastName: "Thomas", gender: "Female", birthDate: "Oct 03, 1990", mobileNumber: "4569872457", email: "Jthomas@yahoo.com", userName: "jyotiT", password: "thomas".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", companyTitle: "twitterbeat", businessLandLineNumber: "235987", website: "macromedia.com")
        let owner4 = Owner(id: 4, firstName: "Millind", lastName: "Gaba", gender: "Male", birthDate: "Apr 08, 1992", mobileNumber: "3419871547", email: "millind67@gmail.com", userName: "Gmillind", password: "gaba".encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", companyTitle: "Rooxo", businessLandLineNumber: "123455", website: "tmall.com")
        let owner5 = Owner(id: 5, firstName: "Charmi", lastName: "Patel", gender: "Female", birthDate: "Nov 03, 1993", mobileNumber: "6584237485", email: "charmi12@outlook.com", userName: "charmiPatel", password: "patel".encrypt(key: "encrypt", iv: "encrypt") ??
            "encrypt", companyTitle: "Multimedia", businessLandLineNumber: "658494", website: "multimedia.com")
        
        // Adding vehicle rent to each vehicles
        let rent1 = VehicleRent(vehicleRentID: 1, rentStartDate: "Jan 01, 2020", rentEndDate: "Jan 06, 2020", numberOfKmDrived: 20, vehicle: bus1)

        let rent2 = VehicleRent(vehicleRentID: 2, rentStartDate: "Feb 05, 2019", rentEndDate: "Feb 10, 2019", numberOfKmDrived: 40, vehicle: car1)

        let rent3 = VehicleRent(vehicleRentID: 3, rentStartDate: "May 08, 2018", rentEndDate: "May 08, 2018", numberOfKmDrived: 200, vehicle: bus2)

        let rent4 = VehicleRent(vehicleRentID: 4, rentStartDate: "Jan 09, 2019", rentEndDate: "Jan 30, 2019", numberOfKmDrived: 140, vehicle:motorcycle2)

        let rent5 = VehicleRent(vehicleRentID: 5, rentStartDate: "Oct 10, 2019", rentEndDate: "Dec 01, 2019", numberOfKmDrived: 310, vehicle: car4)
       
        
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

        addCustomer(customer: customer1)
        addCustomer(customer: customer2)
        addCustomer(customer: customer3)
        addCustomer(customer: customer4)
        addCustomer(customer: customer5)
        
        addOwner(owner: owner1)
        addOwner(owner: owner2)
        addOwner(owner: owner3)
        addOwner(owner: owner4)
        addOwner(owner: owner5)
    }
        
    func getAllCustomers() -> [Customer]{
        var customerList : [Customer] = []
        for i in customerDictionary{
            customerList.append(i.value)
        }
        return customerList
    }
    
    func getAllOwners() -> [Owner]{
        var ownerList : [Owner] = []
        for j in ownerDictionary{
            ownerList.append(j.value)
        }
        return ownerList
    }
}
