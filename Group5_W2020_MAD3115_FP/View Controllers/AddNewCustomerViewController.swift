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
    @IBOutlet weak var txtCompany: UITextField!
    @IBOutlet weak var txtLandlineNo: UITextField!
    @IBOutlet weak var txtWebsite: UITextField!
    
    
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bbAddCustomer = UIBarButtonItem(title: "Add Customer", style: .plain, target: self, action: #selector(addCustomer))
        navigationItem.rightBarButtonItem = bbAddCustomer
        textField_Date.delegate = self
    }
    
    @objc func addCustomer(){
//        if (((txtBillID.text == "" && textField_Date.text == "") && (txtBillAmount.text == "" && txtAgencyName.text == "")) && txtUnitConsumed.text == ""){
//                    let alertController = UIAlertController(title: "No new Hydro Bill created", message:
//                        "Enter all the required details to create new Hydro Bill", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alertController, animated: true, completion: nil)
//                } else if txtBillID.text == ""{
//                    let alertController = UIAlertController(title: "No new Hydro Bill created", message:
//                        "Enter Bill ID", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alertController, animated: true, completion: nil)
//                }else if textField_Date.text == ""{
//                    let alertController = UIAlertController(title: "No new Hydro Bill created", message:
//                        "Enter Bill Date", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alertController, animated: true, completion: nil)
//                }else if txtBillAmount.text == ""{
//                    let alertController = UIAlertController(title: "No new Hydro Bill created", message:
//                        "Enter Bill Amount", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alertController, animated: true, completion: nil)
//                }else if txtAgencyName.text == ""{
//                    let alertController = UIAlertController(title: "No new Hydro Bill created", message:
//                        "Enter Agency Name", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alertController, animated: true, completion: nil)
//                }else if txtUnitConsumed.text == ""{
//                    let alertController = UIAlertController(title: "No new Hydro Bill created", message:
//                        "Enter Unit Consumed", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alertController, animated: true, completion: nil)
//                }else{
//        //            DataStorage.getInstance().addBillToCustomer(bill: Hydro(billId: txtBillID.text ?? "", billDate: textField_Date.text ?? "", totalBillAmount: Float(txtBillAmount.text ?? "")!, agencyName: txtAgencyName.text ?? "", unitConsumed: Int(txtUnitConsumed.text ?? "")!))
//        //
//
//                    let tempObj1 = Hydro(billId: txtBillID.text ?? "", billDate: textField_Date.text ?? "", totalBillAmount: Float(txtBillAmount.text ?? "")!, agencyName: txtAgencyName.text ?? "", unitConsumed: Int(txtUnitConsumed.text ?? "")!)
//
//                    customer?.addBill(bill: tempObj1, billId: tempObj1.billId)
//
//                    navigationController?.popViewController(animated: true)
//                }
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
