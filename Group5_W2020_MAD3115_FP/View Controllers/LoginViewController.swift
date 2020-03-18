//
//  ViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-17.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swhRemember: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.text = "nsandhu@gmail.com"
        txtPassword.text = "nsandhu"
//        let bbLogin = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(login))
//        navigationItem.rightBarButtonItem = bbLogin
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if swhRemember.isOn != true{
            txtEmail.text = ""
            txtPassword.text = ""
        }
    }

    @IBAction func bbLogin(_ sender: UIBarButtonItem) {
//    }
//    @objc func login(){
        if (txtEmail.text == "nsandhu@gmail.com" && txtPassword.text == "nsandhu"){
        if (txtEmail.text?.emailValid() == true && txtPassword.text != ""){
            let alertController = UIAlertController(title: "Login Successful", message:
                "Valid email and password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
//                let sb = UIStoryboard(name: "Main", bundle: nil)
//                let customerListVC = sb.instantiateViewController(identifier: "customerListVC") as! CustomerListViewController
//                self.navigationController?.pushViewController(customerListVC, animated: true)
            }
        }else{
            let alertController = UIAlertController(title: "Login Failed", message:
                "Invalid email and password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

