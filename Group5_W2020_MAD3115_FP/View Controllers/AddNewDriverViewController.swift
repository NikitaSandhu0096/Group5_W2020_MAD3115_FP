//
//  AddNewDriverViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-23.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class AddNewDriverViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var textField_Date: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtLNumber: UITextField!
    @IBOutlet weak var txtDHCleared: UITextField!
    @IBOutlet weak var txtSalary: UITextField!

    var datePicker : UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        let bbAddDriver = UIBarButtonItem(title: "Add Driver", style: .plain, target: self, action: #selector(addDriver))
        navigationItem.rightBarButtonItem = bbAddDriver
        textField_Date.delegate = self
    }
    
    @objc func addDriver(){
            if ((((txtID.text == "" && txtFirstName.text == "") && (txtLastName.text == "" && txtGender.text == "")) && ((textField_Date.text == "" && txtMobile.text == "") && (txtEmail.text == "" && txtUserName.text == ""))) && ((txtPassword.text == "" && txtLNumber.text == "") && (txtDHCleared.text == "" && txtSalary.text == ""))){
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter all the required details to create new Driver", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtID.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's ID", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtFirstName.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's First Name", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtLastName.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Last Name", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtGender.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Gender", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if textField_Date.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Birth Date", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtMobile.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Mobile Number", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtEmail.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Email", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtUserName.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's User Name", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtPassword.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Password", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtLNumber.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's License Number", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtDHCleared.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Driving History Cleared?", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else if txtSalary.text == "" {
                let alertController = UIAlertController(title: "No new Driver created", message: "Enter Driver's Salary", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }else{
                if (txtMobile.text?.mobileValid() == true && txtEmail.text?.emailValid() == true) {
                    DataStorage.getInstance().addDriver(driver: Driver(id: Int(txtID.text ?? "")!, firstName: txtFirstName.text ?? "", lastName: txtLastName.text ?? "", gender: txtGender.text ?? "", birthDate: textField_Date.text ?? "", mobileNumber: txtMobile.text ?? "", email: txtEmail.text ?? "", userName: txtUserName.text ?? "", password: (txtPassword.text ?? "").encrypt(key: "encrypt", iv: "encrypt") ?? "encrypt", drivingLicenseNumber: txtLNumber.text ?? "", isDrivingHistoryCleared: Bool(txtDHCleared.text ?? "")!, salary: Float(txtSalary.text ?? "")!))
                    navigationController?.popViewController(animated: true)
                }else{
                    let alertController = UIAlertController(title: "No New Driver created", message: "Enter valid Mobile Number and Email", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

        override func didReceiveMemoryWarning(){
            super.didReceiveMemoryWarning()
        }
            
        func textFieldDidBeginEditing(_ textField: UITextField){
            self.pickUpDate(self.textField_Date)
        }
        
        func pickUpDate(_ textField : UITextField){
            self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
            self.datePicker.backgroundColor = UIColor.white
            self.datePicker.datePickerMode = UIDatePicker.Mode.date
            textField.inputView = self.datePicker
        
            //ToolBar
            let toolBar = UIToolbar()
            toolBar.barStyle = .default
            toolBar.isTranslucent = true
            toolBar.tintColor = .blue//UIColor(red: 92/255, green: 216/255, blue 255/255, alpha : 1)
            toolBar.sizeToFit()
        
            //Adding Button ToolBar
              
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewCustomerViewController.doneClick))
              
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
              
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddNewCustomerViewController.cancelClick))
              
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            textField.inputAccessoryView = toolBar
        }
             
        @objc func doneClick(){
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateStyle = .medium
            dateFormatter1.timeStyle = .none
            textField_Date.text = dateFormatter1.string(from: datePicker.date)
            textField_Date.resignFirstResponder()
        }
             
        @objc func cancelClick(){
            textField_Date.resignFirstResponder()
        }
    }


