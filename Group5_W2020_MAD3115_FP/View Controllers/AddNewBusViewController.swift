//
//  AddNewBusViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-20.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class AddNewBusViewController: UIViewController, UITextFieldDelegate {
    
    var person : Person?
    var driverNames : [Driver] = []
    
    var driverPicker : UIPickerView!

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
    @IBOutlet weak var txtDriver: UITextField!
    
    var tempDriver : Driver?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bbAddBus = UIBarButtonItem(title: "Add Bus", style: .plain, target: self, action: #selector(addBus))
        navigationItem.rightBarButtonItem = bbAddBus
        
        txtDriver.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        driverNames = DataStorage.getInstance().getAllDrivers()
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
            
            let owner = person as! Owner
            let tempobj = Bus(identificationNumber: txtIDNo.text ?? "", description: txtDescription.text ?? "", isSelfDrive: Bool(txtSelfDrive.text ?? "")!, manufacturerName: txtManufacturerName.text ?? "", isInsured: Bool(txtInsured.text ?? "")!, vehicleNoOfSeats: Int(txtNoofSeats.text ?? "")!, insuranceProviderName: txtInsurancePName.text ?? "", fuelType: txtFuelType.text ?? "", ratePerDay: Float(txtRateDay.text ?? "")!, ratePerKm: Float(txtRateKM.text ?? "")!, busType: txtBusType.text ?? "", iswifiAvailable: Bool(txtWifi.text ?? "")!, isAccessibiltyServiceAvailable: Bool(txtAccessibility.text ?? "")!, driver: tempDriver!)
            
            owner.addVehicleOwned(vehicleOwned: tempobj, vehicleIdentificationNumber: tempobj.identificationNumber)
            
            navigationController?.popViewController(animated: true)
        }
    }
     override func didReceiveMemoryWarning()
             {
                 super.didReceiveMemoryWarning()
             }
            
             func textFieldDidBeginEditing(_ textField: UITextField)
             {
                 self.pickDriver(self.txtDriver)
             }
            
             func pickDriver(_ textField : UITextField)
             {
                 self.driverPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
                self.driverPicker.delegate = self
                 self.driverPicker.backgroundColor = UIColor.white
                        
                 textField.inputView = self.driverPicker
              
                 //ToolBar
                 let toolBar = UIToolbar()
                 toolBar.barStyle = .default
                 toolBar.isTranslucent = true
                 toolBar.tintColor = .blue//UIColor(red: 92/255, green: 216/255, blue 255/255, alpha : 1)
                 toolBar.sizeToFit()
              
                 //Adding Button ToolBar
              
                 let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewCarViewController.doneClick))
              
                 let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
              
                 let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewCarViewController.cancelClick))
              
                 toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
                 toolBar.isUserInteractionEnabled = true
                 textField.inputAccessoryView = toolBar
             }
             
             @objc func doneClick(){
                tempDriver = driverNames[self.driverPicker.selectedRow(inComponent: 0)];
                txtDriver.text = driverNames[self.driverPicker.selectedRow(inComponent: 0)].fullName;
                 txtDriver.resignFirstResponder()
             }
             
             @objc func cancelClick(){
                 txtDriver.resignFirstResponder()
             }
        }


    extension AddNewBusViewController: UIPickerViewDelegate, UIPickerViewDataSource{
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1;
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return driverNames.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return driverNames[row].fullName;
        }
        
    }


