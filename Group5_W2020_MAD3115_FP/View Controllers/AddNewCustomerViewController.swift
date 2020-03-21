//
//  AddNew CustomerViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-19.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class AddNewCustomerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var textField_Date: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bbAddCustomer = UIBarButtonItem(title: "Add Customer", style: .plain, target: self, action: #selector(addCustomer))
        navigationItem.rightBarButtonItem = bbAddCustomer
        textField_Date.delegate = self
    }
    
    @objc func addCustomer(){
        if ((((txtID.text == "" && txtFirstName.text == "") && (txtLastName.text == "" && txtGender.text == "")) && ((textField_Date.text == "" && txtMobile.text == "") && (txtEmail.text == "" && txtUserName.text == ""))) && ((txtPassword.text == "" && txtAddress.text == "") && txtCity.text == "")){
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter all the required details to create new Customer", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtID.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's ID", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtFirstName.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's First Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtLastName.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's Last Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtGender.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's Gender", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if textField_Date.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's Birth Date", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtMobile.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's Mobile Number", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtEmail.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's Email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtUserName.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's User Name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtPassword.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's Password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtAddress.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's Address", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else if txtCity.text == "" {
            let alertController = UIAlertController(title: "No new Customer created", message: "Enter Customer's City", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else{
            if (txtMobile.text?.mobileValid() == true && txtEmail.text?.emailValid() == true) {
               navigationController?.popViewController(animated: true)
            } else{
                let alertController = UIAlertController(title: "No New Customer created", message: "Enter valid Mobile Number and Email", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning()
     {
         super.didReceiveMemoryWarning()
     }
    
     func textFieldDidBeginEditing(_ textField: UITextField)
     {
         self.pickUpDate(self.textField_Date)
     }
    
     func pickUpDate(_ textField : UITextField)
     {
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
