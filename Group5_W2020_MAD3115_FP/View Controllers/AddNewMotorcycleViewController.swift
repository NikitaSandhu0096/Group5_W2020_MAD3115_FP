//
//  AddNewMotorcycleViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-20.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class AddNewMotorcycleViewController: UIViewController {

    var person : Person?

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
    @IBOutlet weak var txtMaxSpeed: UITextField!
    @IBOutlet weak var txtMilage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bbAddMotorcycle = UIBarButtonItem(title: "Add Motorcycle", style: .plain, target: self, action: #selector(addMotorcycle))
        navigationItem.rightBarButtonItem = bbAddMotorcycle
    }
    
     @objc func addMotorcycle(){
        if ((((txtIDNo.text == "" && txtDescription.text == "") && (txtSelfDrive.text == "" && txtManufacturerName.text == "")) && ((txtInsured.text == "" && txtNoofSeats.text == "") && (txtInsurancePName.text == "" && txtFuelType.text == ""))) && ((txtRateDay.text == "" && txtRateKM.text == "") && (txtMaxSpeed.text == "" && txtMilage.text == ""))){
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter all the required details to create new Motorcycle", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtIDNo.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Identification Number", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtDescription.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Description", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtSelfDrive.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Is Self Drive?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtManufacturerName.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Manufacturer Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtInsured.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Is Insured?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtNoofSeats.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Number of Seats", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtInsurancePName.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Insurance Provider's Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtFuelType.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Fuel Type", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtRateDay.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Rate Per Day", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtRateKM.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Rate Per KM", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtMaxSpeed.text == "" {
                let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Max Top Speed", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
        }else if txtMilage.text == "" {
            let alertController = UIAlertController(title: "No new Motorcycle created", message: "Enter Motorcycle's Milage", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else{
            let owner = person as! Owner
            let tempobj = MotorCycle(identificationNumber: txtIDNo.text ?? "", description: txtDescription.text ?? "", manufacturerName: txtManufacturerName.text ?? "", isSelfDrive: Bool(txtSelfDrive.text ?? "")!, isInsured: Bool(txtInsured.text ?? "")!, insuranceProviderName: txtInsurancePName.text ?? "", vehicleNoOfSeats: Int(txtNoofSeats.text ?? "")!, fuelType: txtFuelType.text ?? "", ratePerDay: Float(txtRateDay.text ?? "")!, ratePerKm: Float(txtRateKM.text ?? "")!, maxTopSpeed: Int(txtMaxSpeed.text ?? "")!, milage: Int(txtMilage.text ?? "")!)
            
            owner.addVehicleOwned(vehicleOwned: tempobj, vehicleIdentificationNumber: tempobj.identificationNumber)
            
            navigationController?.popViewController(animated: true)
        }
    }
}


