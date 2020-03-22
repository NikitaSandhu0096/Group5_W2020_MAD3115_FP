//
//  DriverDetailsViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-22.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class DriverDetailsViewController: UIViewController {

    var driver : Driver?
    
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
//        if person?.type == "Driver"{
            lblDetail14.text = "Driver's Details"
//            let driver = person as! Driver
        lblID.text = "ID                                       :  \(driver!.id)"
        lblFirstName.text = "First Name                        :  \(driver!.firstName)"
        lblLastName.text = "Last Name                        :  \(driver!.lastName)"
        lblGender.text = "Gender                              :  \(driver!.gender)"
        lblBirthdate.text = "Birthdate                           :  \(driver!.birthDate.evaluateDate())"
        lblAge.text = "Age                                     :  \(driver!.calculateAge())"
        lblMobileNumber.text = "Mobile Number                 :  \(driver!.mobileNumber)"
        lblEmail.text = "email                                  :  \(driver!.email)"
        lblUserName.text = "User Name                        :  \(driver!.userName)"
        lblPassword.text = "Password                          :  \(driver!.password)"
        lblDetail11.text = "License Number               :  \(driver!.drivingLicenseNumber)"
        lblDetail12.text = "Driving History Cleared? :  \(driver!.isDrivingHistoryCleared)"
        lblDetail13.text = "Salary                                :  \(driver!.salary)"
        }
    }
//}
