//
//  AddNewBusViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-20.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class AddNewBusViewController: UIViewController {

    @IBOutlet weak var txtIDNo: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtSelfDrive: UITextField!
    @IBOutlet weak var txtManufacturerName: UITextField!
    @IBOutlet weak var txtInsured: UITextField!
    @IBOutlet weak var txtNoofSeats: UITextField!
    @IBOutlet weak var txtInsurancePName: UITextField!
    @IBOutlet weak var txtFuelType: UITextField!
    @IBOutlet weak var txtRateDay: UITextField!
    @IBOutlet weak var txtRateKM: UITextField!
    @IBOutlet weak var txtBusType: UITextField!
    @IBOutlet weak var txtAccessibility: UITextField!
    @IBOutlet weak var txtWifi: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bbAddBus = UIBarButtonItem(title: "Add Bus", style: .plain, target: self, action: #selector(addBus))
        navigationItem.rightBarButtonItem = bbAddBus
    }
    
    @objc func addBus(){
        if ((((txtIDNo.text == "" && txtDescription.text == "") && (txtSelfDrive.text == "" && txtManufacturerName.text == "")) && ((txtInsured.text == "" && txtNoofSeats.text == "") && (txtInsurancePName.text == "" && txtFuelType.text == ""))) && (((txtRateDay.text == "" && txtRateKM.text == "") && (txtBusType.text == "" && txtAccessibility.text == "")) && txtWifi.text == "")){
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter all the required details to create new Bus", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtIDNo.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Identification Number", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtDescription.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Description", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtSelfDrive.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Is Self Drive?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtManufacturerName.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Manufacturer Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtInsured.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Is Insured?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtNoofSeats.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Number of Seats", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtInsurancePName.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Insurance Provider's Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtFuelType.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Fuel Type", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtRateDay.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Rate Per Day", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtRateKM.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Rate Per KM", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtBusType.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Type", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtAccessibility.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Is Accessibility Available?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtWifi.text == "" {
            let alertController = UIAlertController(title: "No new Bus created", message: "Enter Bus's Is Wifi Available?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
}

