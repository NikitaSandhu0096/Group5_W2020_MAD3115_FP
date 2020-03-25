//
//  PersonListViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-18.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController {

    @IBOutlet weak var segPerson: UISegmentedControl!
    @IBOutlet weak var tblPersons: UITableView!
    var customerNames : [Customer] = []
    var ownerNames : [Owner] = []
    var driverNames : [Driver] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customerNames = DataStorage.getInstance().getAllCustomers()
        ownerNames = DataStorage.getInstance().getAllOwners()
        driverNames = DataStorage.getInstance().getAllDrivers()
        tblPersons.reloadData()
    }
    
    @IBAction func bbLogout(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Menu", message: "Select an option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "About Us", style: .default, handler: { (action) in
        
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let contactAboutViewController = sb.instantiateViewController(identifier: "ContactAboutViewController") as! ContactAboutViewController
            contactAboutViewController.menuVC = "About Us"
//            addNewCarViewController.person = self.person
            self.navigationController?.pushViewController(contactAboutViewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Contact Us", style: .default, handler: { (action) in
                
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let contactAboutViewController = sb.instantiateViewController(identifier: "ContactAboutViewController") as! ContactAboutViewController
            contactAboutViewController.menuVC = "Contact Us"
            self.navigationController?.pushViewController(contactAboutViewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Logout", style: .default, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func segPerson(_ sender: UISegmentedControl) {
        tblPersons.reloadData()
    }
    
    @IBAction func bbAdd(_ sender: UIBarButtonItem) {
        if segPerson.selectedSegmentIndex == 0{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let addNewCustomerViewController = sb.instantiateViewController(identifier: "AddNewCustomerViewController") as! AddNewCustomerViewController
//            addNewCustomerViewController.person = self.customerNames
            self.navigationController?.pushViewController(addNewCustomerViewController, animated: true)
        }else if segPerson.selectedSegmentIndex == 1{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let addNewOwnerViewController = sb.instantiateViewController(identifier: "AddNewOwnerViewController") as! AddNewOwnerViewController
//            addNewOwnerViewController.customer = self.customer
            self.navigationController?.pushViewController(addNewOwnerViewController, animated: true)
        }else{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let addNewDriverViewController = sb.instantiateViewController(identifier: "AddNewDriverViewController") as! AddNewDriverViewController
//            addNewOwnerViewController.customer = self.customer
            self.navigationController?.pushViewController(addNewDriverViewController, animated: true)
        }
//        let alert = UIAlertController(title: "Add Person", message: "Select type of person", preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Customer", style: .default, handler: { (action) in
//
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let addNewCustomerViewController = sb.instantiateViewController(identifier: "AddNewCustomerViewController") as! AddNewCustomerViewController
////            addNewCustomerViewController.person = self.customerNames
//            self.navigationController?.pushViewController(addNewCustomerViewController, animated: true)
//        }))
//        alert.addAction(UIAlertAction(title: "Owner", style: .default, handler:{ (action) in
//
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let addNewOwnerViewController = sb.instantiateViewController(identifier: "AddNewOwnerViewController") as! AddNewOwnerViewController
////            addNewOwnerViewController.customer = self.customer
//            self.navigationController?.pushViewController(addNewOwnerViewController, animated: true)
//        }))
//        self.present(alert, animated: true, completion: nil)
    }
}

extension PersonListViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segPerson.selectedSegmentIndex == 0{
        return customerNames.count
        } else if segPerson.selectedSegmentIndex == 1{
            return ownerNames.count
        }else{
            return driverNames.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell")
    
        if segPerson.selectedSegmentIndex == 0{
            let customer = customerNames[indexPath.row]
            cell?.textLabel?.text = customer.fullName
        }else if segPerson.selectedSegmentIndex == 1{
            let owner = ownerNames[indexPath.row]
            cell?.textLabel?.text = owner.fullName
        }else{
            let driver = driverNames[indexPath.row]
            cell?.textLabel?.text = driver.fullName
        }

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if segPerson.selectedSegmentIndex == 0{
            let c = DataStorage.getInstance().getAllCustomers()
            let sc = c[indexPath.row]
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let personDetailsViewController = sb.instantiateViewController(identifier: "PersonDetailsViewController") as! PersonDetailsViewController
            personDetailsViewController.person = sc
            self.navigationController?.pushViewController(personDetailsViewController, animated: true)
        }else if segPerson.selectedSegmentIndex == 1{
            let c = DataStorage.getInstance().getAllOwners()
            let sc = c[indexPath.row]
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let personDetailsViewController = sb.instantiateViewController(identifier: "PersonDetailsViewController") as! PersonDetailsViewController
            personDetailsViewController.person = sc
            self.navigationController?.pushViewController(personDetailsViewController, animated: true)
        }else{
            let c = DataStorage.getInstance().getAllDrivers()
            let sc = c[indexPath.row]
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let driverDetailsViewController = sb.instantiateViewController(identifier: "DriverDetailsViewController") as! DriverDetailsViewController
            driverDetailsViewController.driver = sc
            self.navigationController?.pushViewController(driverDetailsViewController, animated: true)
        }
    }
}
