//
//  ContactAboutViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-25.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class ContactAboutViewController: UIViewController {
    
    var menuVC : String?
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var lblInfo1: UILabel!
    @IBOutlet weak var lblInfo2: UILabel!
    @IBOutlet weak var lblInfo3: UILabel!
    @IBOutlet weak var lblInfo4: UILabel!
    @IBOutlet weak var lblInfo5: UILabel!
    @IBOutlet weak var lblInfo6: UILabel!
    @IBOutlet weak var lblInfo7: UILabel!
    @IBOutlet weak var lblInfo8: UILabel!
    @IBOutlet weak var lblInfo9: UILabel!
    @IBOutlet weak var lblInfo10: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        display()
    }
    
    func display(){
        if menuVC == "About Us"{
            lblInfo.text = "About Us"
            lblInfo1.text = "This is a project created by a 3 member group."
            lblInfo2.text = "Nikita Sandhu C0766552"
            lblInfo3.text = "Kamalpreet Kaur C0777682"
            lblInfo4.text = "Jyothi Thomas C0775696"
            lblInfo5.text = "This is Vehicle Renting System project."
            lblInfo6.text = "Respective Entities are as follows - "
            lblInfo7.text = "Customers with their related rent Info."
            lblInfo8.text = "Owners with related list of vehicle that they own."
            lblInfo9.text = "Driver Info."
            lblInfo10.text = "Vehicles with their related info."
        }else{
            if menuVC == "Contact Us"{
                lblInfo.text = "Contact Us"
                lblInfo1.text = "You can contact us via email"
                lblInfo2.text = "NKJ@yahoo.com"
            }
        }
    }

}
