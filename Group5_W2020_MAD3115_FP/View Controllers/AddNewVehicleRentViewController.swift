//
//  AddNewVehicleRentViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-22.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class AddNewVehicleRentViewController: UIViewController, UITextFieldDelegate {

    var person : Person?
    var vehicleNames : [Vehicle] = []
    
    var vehiclePicker : UIPickerView!
    var datePicker : UIDatePicker!
    
    @IBOutlet weak var txtVRID: UITextField!
    @IBOutlet weak var txtRSDate: UITextField!
    @IBOutlet weak var txtREDate: UITextField!
    @IBOutlet weak var txtNoofKM: UITextField!
    @IBOutlet weak var txtVehicle: UITextField!
    
    var datePicker1 : UIDatePicker!
    var datePicker2 : UIDatePicker!

    var tempVehicle : Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bbAddVehicleRent = UIBarButtonItem(title: "Add Vehicle Rent", style: .plain, target: self, action: #selector(addVehicleRent))
        navigationItem.rightBarButtonItem = bbAddVehicleRent
        
        txtRSDate.delegate = self
        txtREDate.delegate = self
        txtVehicle.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vehicleNames = DataStorage.getInstance().getAllVehicles()
    }
    
    @objc func addVehicleRent(){
      if (((txtVRID.text == "" && txtRSDate.text == "") && (txtREDate.text == "" && txtNoofKM.text == "")) && txtVehicle.text == ""){
        let alertController = UIAlertController(title: "No new Vehicle Rent created", message: "Enter all the required details to create new Vehicle Rent", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
      }else if txtVRID.text == "" {
            let alertController = UIAlertController(title: "No new Vehicle Rent created", message: "Enter Vehicle Rent's ID", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
      }else if txtRSDate.text == "" {
            let alertController = UIAlertController(title: "No new Vehicle Rent created", message: "Enter Vehicle Rent's Start Date", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
      }else if txtREDate.text == "" {
            let alertController = UIAlertController(title: "No new Vehicle Rent created", message: "Enter Vehicle Rent's End Date", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
      }else if txtNoofKM.text == "" {
            let alertController = UIAlertController(title: "No new Vehicle Rent created", message: "Enter Vehicle Rent's Number of KM Drived", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
      }else if txtVehicle.text == "" {
            let alertController = UIAlertController(title: "No new Vehicle Rent created", message: "Enter Vehicle Rent's Vehicle", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
      }else{
            let customer = person as! Customer
            let tempobj = VehicleRent(vehicleRentID: Int(txtVRID.text ?? "")!, rentStartDate: txtRSDate.text ?? "", rentEndDate: txtREDate.text ?? "", numberOfKmDrived: Int(txtNoofKM.text ?? "")!, vehicle: tempVehicle!)

            customer.addVehicleRent(vehicleRent: tempobj, vehicleRentID: tempobj.vehicleRentID)

            navigationController?.popViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
                    
    func textFieldDidBeginEditing(_ textField: UITextField){
        self.pickDriver(self.txtVehicle)
        self.pickUpDate1(self.txtRSDate)
        self.pickUpDate2(self.txtREDate)
    }
    
//    func textFieldDidBeginEditing(_ textField1: UITextField , _ textField2: UITextField){
//        self.pickUpDate1(self.txtRSDate)
//        self.pickUpDate2(self.txtREDate)
//    }
    
    func pickUpDate1(_ textField : UITextField){
        self.datePicker1 = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker1.backgroundColor = UIColor.white
        self.datePicker1.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker1
          
        //ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .blue//UIColor(red: 92/255, green: 216/255, blue 255/255, alpha : 1)
        toolBar.sizeToFit()
          
        //Adding Button ToolBar
          
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewVehicleRentViewController.doneSClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewVehicleRentViewController.cancelSClick))
          
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneSClick(){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        txtRSDate.text = dateFormatter1.string(from: datePicker1.date)
        txtRSDate.resignFirstResponder()
    }
     
    @objc func cancelSClick(){
        txtRSDate.resignFirstResponder()
    }
    
    func pickUpDate2(_ textField : UITextField){
        self.datePicker2 = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker2.backgroundColor = UIColor.white
        self.datePicker2.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker2
          
        //ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .blue//UIColor(red: 92/255, green: 216/255, blue 255/255, alpha : 1)
        toolBar.sizeToFit()
          
        //Adding Button ToolBar
          
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewVehicleRentViewController.doneEClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewVehicleRentViewController.cancelEClick))
          
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneEClick(){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        txtREDate.text = dateFormatter1.string(from: datePicker1.date)
        txtREDate.resignFirstResponder()
    }
     
    @objc func cancelEClick(){
        txtRSDate.resignFirstResponder()
    }
    
    func pickDriver(_ textField : UITextField){
        self.vehiclePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.vehiclePicker.delegate = self
        self.vehiclePicker.backgroundColor = UIColor.white
                                
        textField.inputView = self.vehiclePicker
                    
        //ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .blue//UIColor(red: 92/255, green: 216/255, blue 255/255, alpha : 1)
        toolBar.sizeToFit()
                      
        //Adding Button ToolBar
                      
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewVehicleRentViewController.doneDClick))
                
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                      
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewVehicleRentViewController.cancelDClick))
                      
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
                     
    @objc func doneDClick(){
        tempVehicle = vehicleNames[self.vehiclePicker.selectedRow(inComponent: 0)]
        txtVehicle.text = "\(vehicleNames[self.vehiclePicker.selectedRow(inComponent: 0)].type)  :  \(vehicleNames[self.vehiclePicker.selectedRow(inComponent: 0)].description)"
        txtVehicle.resignFirstResponder()
    }
                     
    @objc func cancelDClick(){
        txtVehicle.resignFirstResponder()
    }
}

extension AddNewVehicleRentViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
                
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vehicleNames.count
    }
                
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(vehicleNames[row].type)  :  \(vehicleNames[row].description)"
    }
}
