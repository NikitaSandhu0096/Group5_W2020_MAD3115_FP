//
//  PersonDetailsViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-18.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    @IBOutlet weak var tblVehicle: UITableView!
    var person : Person?
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBirthdate: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblMobileNumber: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblDetail11: UILabel!
    @IBOutlet weak var lblDetail12: UILabel!
    @IBOutlet weak var lblDetail13: UILabel!
    @IBOutlet weak var lblDetail14: UILabel!
    @IBOutlet weak var lblVehicleList: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
    }
    override func viewWillAppear(_ animated: Bool) {
        display()
        tblVehicle.reloadData();
    }
    
    func display(){
        if person?.type == "Owner"{
            lblDetail14.text = "Owner's Details"
            let owner = person as! Owner
            lblID.text = "ID                                   :  \(owner.id)"
            lblFirstName.text = "First Name                    :  \(owner.firstName)"
            lblLastName.text = "Last Name                    :  \(owner.lastName)"
            lblGender.text = "Gender                          :  \(owner.gender)"
            lblBirthdate.text = "Birthdate                       :  \(owner.birthDate.evaluateDate())"
            lblAge.text = "Age                                 :  \(owner.calculateAge())"
            lblMobileNumber.text = "Mobile Number             :  \(owner.mobileNumber)"
            lblEmail.text = "email                              :  \(owner.email)"
            lblUserName.text = "User Name                    :  \(owner.userName)"
            lblPassword.text = "Password                       :  \(owner.password)"
            lblDetail11.text = "Company Title              :  \(owner.companyTitle)"
            lblDetail12.text = "Business Landline No. :  \(owner.businessLandLineNumber)"
            lblDetail13.text = "Website                         :  \(owner.website)"
            lblVehicleList.text = "Vehicles Owned by Owner"
        }else{
            lblDetail14.text = "Customer's Details"
            let customer = person as! Customer
            lblID.text = "ID                        : \(customer.id)"
            lblFirstName.text = "First Name         :  \(customer.firstName)"
            lblLastName.text = "Last Name         :  \(customer.lastName)"
            lblGender.text = "Gender               :  \(customer.gender)"
            lblBirthdate.text = "Birthdate            :  \(customer.birthDate.evaluateDate())"
            lblAge.text = "Age                     :  \(customer.calculateAge())"
            lblMobileNumber.text = "Mobile Number :  \(customer.mobileNumber)"
            lblEmail.text = "email                  :  \(customer.email)"
            lblUserName.text = "User Name        :  \(customer.userName)"
            lblPassword.text = "Password          :  \(customer.password)"
            lblDetail11.text = "Address             :  \(customer.address)"
            lblDetail12.text = "City                    :  \(customer.city)"
            lblDetail13.text = "Amount to pay  :  \(customer.amountToPayForAllRentedVehicles.currency())"
            lblVehicleList.text = "Vehicles rented by customer"
        }
    }
    @IBAction func bbDelete(_ sender: UIBarButtonItem){
        if person?.type == "Owner"{
            let owner = person as! Owner
            DataStorage.getInstance().removeOwner(owner: Owner(id: owner.id, firstName: owner.firstName, lastName: owner.lastName, gender: owner.gender, birthDate: owner.birthDate, mobileNumber: owner.mobileNumber, email: owner.email, userName: owner.userName, password: owner.password, companyTitle: owner.companyTitle, businessLandLineNumber: owner.businessLandLineNumber, website: owner.website))
            navigationController?.popViewController(animated: true)
        } else{
            let customer = person as! Customer
            DataStorage.getInstance().removeCustomer(customer: Customer(id: customer.id, firstName: customer.firstName, lastName: customer.lastName, gender: customer.gender, birthDate: customer.birthDate, mobileNumber: customer.mobileNumber, email: customer.email, userName: customer.userName, password: customer.password, address: customer.address, city: customer.city))
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func bbAdd(_ sender: UIBarButtonItem) {
        if person?.type == "Owner"{
            let alert = UIAlertController(title: "Add Vehicle", message: "Select type of vehicle", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Car", style: .default, handler: { (action) in
            
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let addNewCarViewController = sb.instantiateViewController(identifier: "AddNewCarViewController") as! AddNewCarViewController
                addNewCarViewController.person = self.person
                self.navigationController?.pushViewController(addNewCarViewController, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Bus", style: .default, handler:{ (action) in
            
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let addNewBusViewController = sb.instantiateViewController(identifier: "AddNewBusViewController") as! AddNewBusViewController
                addNewBusViewController.person = self.person
                self.navigationController?.pushViewController(addNewBusViewController, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Motorcycle", style: .default, handler:{ (action) in
                        
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let addNewMotorcycleViewController = sb.instantiateViewController(identifier: "AddNewMotorcycleViewController") as! AddNewMotorcycleViewController
                addNewMotorcycleViewController.person = self.person
                self.navigationController?.pushViewController(addNewMotorcycleViewController, animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let addNewVehicleRentViewController = sb.instantiateViewController(identifier: "AddNewVehicleRentViewController") as! AddNewVehicleRentViewController
            addNewVehicleRentViewController.person = self.person
            self.navigationController?.pushViewController(addNewVehicleRentViewController, animated: true)
        }
    }
}

extension PersonDetailsViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if person?.type == "Owner"{
            let owner = person as! Owner
            return owner.getVehicles().count
        }
            else{
            let customer = person as! Customer
            return customer.getVehicleRented().count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell") as! VehicleCellTableViewCell

        if person?.type == "Owner"{
            let owner = person as! Owner
            let owner1 = owner.getVehicles()[indexPath.row]
            cell.lblVehicleType.text = "Vehicle Type : \(owner1.type)"
            cell.lblVehicleDescription.text = "Vehicle Descrption : \(owner1.description)"
        }
            else{
            let customer = person as! Customer
            let vehicleRented = customer.getVehicleRented()[indexPath.row]
            cell.lblVehicleType.text = "Vehicle Type : \(vehicleRented.vehicle.type)"
            cell.lblVehicleDescription.text = "Vehicle Description : \(vehicleRented.vehicle.description)"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if person?.type == "Owner"{
            let owner = person as! Owner
            let sc = owner.getVehicles()[indexPath.row]
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vehicleDetailsViewController = sb.instantiateViewController(identifier: "VehicleDetailsViewController") as! VehicleDetailsViewController
            vehicleDetailsViewController.vehicle = sc
            vehicleDetailsViewController.previousVC = "owner"
            self.navigationController?.pushViewController(vehicleDetailsViewController, animated: true)
        }else{
            let customer = person as! Customer
            let sc = customer.getVehicleRented()[indexPath.row];
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vehicleDetailsViewController = sb.instantiateViewController(identifier: "VehicleDetailsViewController") as! VehicleDetailsViewController
            vehicleDetailsViewController.vehicle = sc.vehicle;
            vehicleDetailsViewController.vehicleRent = sc;
            vehicleDetailsViewController.previousVC = "customer"
            self.navigationController?.pushViewController(vehicleDetailsViewController, animated: true)
        }
    }
}
