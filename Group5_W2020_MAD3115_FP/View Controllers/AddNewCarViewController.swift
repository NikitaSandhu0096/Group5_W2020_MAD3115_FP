//
//  AddNewCarViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-20.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class AddNewCarViewController: UIViewController {

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
    @IBOutlet weak var txtCarType: UITextField!
    @IBOutlet weak var txtCarColor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bbAddCar = UIBarButtonItem(title: "Add Car", style: .plain, target: self, action: #selector(addCar))
        navigationItem.rightBarButtonItem = bbAddCar
    }
    
    @objc func addCar(){
        if ((((txtIDNo.text == "" && txtDescription.text == "") && (txtSelfDrive.text == "" && txtManufacturerName.text == "")) && ((txtInsured.text == "" && txtNoofSeats.text == "") && (txtInsurancePName.text == "" && txtFuelType.text == ""))) && ((txtRateDay.text == "" && txtRateKM.text == "") && (txtCarType.text == "" && txtCarColor.text == ""))){
            let alertController = UIAlertController(title: "No new Car created", message: "Enter all the required details to create new Car", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtIDNo.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Identification Number", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtDescription.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Description", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtSelfDrive.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Is Self Drive?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtManufacturerName.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Manufacturer Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtInsured.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Is Insured?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtNoofSeats.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Number of Seats", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtInsurancePName.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Insurance Provider's Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtFuelType.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Fuel Type", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtRateDay.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Rate Per Day", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtRateKM.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Rate Per KM", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtCarType.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Type", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtCarColor.text == "" {
            let alertController = UIAlertController(title: "No new Car created", message: "Enter Car's Color", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else{
                navigationController?.popViewController(animated: true)
        }
    }
}

