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
    
    @IBAction func bbAdd(_ sender: UIBarButtonItem) {
        if person?.type == "Owner"{
            let alert = UIAlertController(title: "Add Vehicle", message: "Select type of vehicle", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Car", style: .default, handler: { (action) in
            
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let addNewCarViewController = sb.instantiateViewController(identifier: "AddNewCarViewController") as! AddNewCarViewController
//            addNewCustomerViewController.person = self.customerNames
                self.navigationController?.pushViewController(addNewCarViewController, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Bus", style: .default, handler:{ (action) in
            
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let addNewBusViewController = sb.instantiateViewController(identifier: "AddNewBusViewController") as! AddNewBusViewController
//            addNewOwnerViewController.customer = self.customer
                self.navigationController?.pushViewController(addNewBusViewController, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Motorcycle", style: .default, handler:{ (action) in
                        
                            let sb = UIStoryboard(name: "Main", bundle: nil)
                            let addNewMotorcycleViewController = sb.instantiateViewController(identifier: "AddNewMotorcycleViewController") as! AddNewMotorcycleViewController
            //            addNewOwnerViewController.customer = self.customer
                            self.navigationController?.pushViewController(addNewMotorcycleViewController, animated: true)
                        }))
            self.present(alert, animated: true, completion: nil)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell")

        if person?.type == "Owner"{
            let owner = person as! Owner
            let owner1 = owner.getVehicles()[indexPath.row]
            cell?.textLabel?.text = owner1.type
        }
            else{
            let customer = person as! Customer
            let vehicleRented = customer.getVehicleRented()[indexPath.row];
            cell?.textLabel?.text = vehicleRented.vehicle.type
        }

        return cell!
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(100.0)
//    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if person?.type == "Owner"{
            let owner = person as! Owner
            let sc = owner.getVehicles()[indexPath.row]
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vehicleDetailsViewController = sb.instantiateViewController(identifier: "VehicleDetailsViewController") as! VehicleDetailsViewController
            vehicleDetailsViewController.vehicle = sc
            vehicleDetailsViewController.previousVC = "owner";
            self.navigationController?.pushViewController(vehicleDetailsViewController, animated: true)
        }else{
            let customer = person as! Customer
            let sc = customer.getVehicleRented()[indexPath.row];
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vehicleDetailsViewController = sb.instantiateViewController(identifier: "VehicleDetailsViewController") as! VehicleDetailsViewController
            vehicleDetailsViewController.vehicle = sc.vehicle;
            vehicleDetailsViewController.vehicleRent = sc;
            vehicleDetailsViewController.previousVC = "customer";
            self.navigationController?.pushViewController(vehicleDetailsViewController, animated: true)
        }
    }
}
