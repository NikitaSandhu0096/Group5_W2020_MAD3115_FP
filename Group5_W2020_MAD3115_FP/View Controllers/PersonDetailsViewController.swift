//
//  PersonDetailsViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-18.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
    }
    func display(){
        if person?.type == "Owner"{
            lblDetail14.text = "Owner's Details"
            let owner = person as! Owner
            lblID.text = "ID : \(owner.id)"
            lblFirstName.text = "First Name : \(owner.firstName)"
            lblLastName.text = "Last Name : \(owner.lastName)"
            lblGender.text = "Gender : \(owner.gender)"
            lblBirthdate.text = "Birthdate : \(owner.birthDate)"
            lblAge.text = "Age : \(owner.calculateAge())"
            lblMobileNumber.text = "Mobile Number : \(owner.mobileNumber)"
            lblEmail.text = "email : \(owner.email)"
            lblUserName.text = "User Name : \(owner.userName)"
            lblPassword.text = "Password : \(owner.password)"
            lblDetail11.text = "Company Title : \(owner.companyTitle)"
            lblDetail12.text = "Business Landline Number : \(owner.businessLandLineNumber)"
            lblDetail13.text = "Website : \(owner.website)"
        }else{
            lblDetail14.text = "Customer's Details"
            let customer = person as! Customer
            lblID.text = "ID : \(customer.id)"
            lblFirstName.text = "First Name : \(customer.firstName)"
            lblLastName.text = "Last Name : \(customer.lastName)"
            lblGender.text = "Gender : \(customer.gender)"
            lblBirthdate.text = "Birthdate : \(customer.birthDate)"
            lblAge.text = "Age : \(customer.calculateAge())"
            lblMobileNumber.text = "Mobile Number : \(customer.mobileNumber)"
            lblEmail.text = "email : \(customer.email)"
            lblUserName.text = "User Name : \(customer.userName)"
            lblPassword.text = "Password : \(customer.password)"
            lblDetail11.text = "CAddress : \(customer.address)"
            lblDetail12.text = "City : \(customer.city)"
            lblDetail13.text = "Amount to pay for all the rented vehicles : \(customer.amountToPayForAllRentedVehicles.currency())"
        }
    }
}
