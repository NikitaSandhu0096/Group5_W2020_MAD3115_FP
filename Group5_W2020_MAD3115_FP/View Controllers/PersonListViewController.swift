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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customerNames = DataStorage.getInstance().getAllCustomers()
        ownerNames = DataStorage.getInstance().getAllOwners()
        tblPersons.reloadData()
    }
    
    @IBAction func bbLogout(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func segPerson(_ sender: UISegmentedControl) {
        tblPersons.reloadData()
    }
    
    @IBAction func bbAdd(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Person", message: "Select type of person", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Customer", style: .default, handler: { (action) in
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let addNewCustomerViewController = sb.instantiateViewController(identifier: "AddNewCustomerViewController") as! AddNewCustomerViewController
//            addNewCustomerViewController.person = self.customerNames
            self.navigationController?.pushViewController(addNewCustomerViewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Owner", style: .default, handler:{ (action) in
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let addNewOwnerViewController = sb.instantiateViewController(identifier: "AddNewOwnerViewController") as! AddNewOwnerViewController
//            addNewOwnerViewController.customer = self.customer
            self.navigationController?.pushViewController(addNewOwnerViewController, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension PersonListViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segPerson.selectedSegmentIndex == 0{
        return customerNames.count
        } else{
            return ownerNames.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell")
    
        if segPerson.selectedSegmentIndex == 0{
            let customer = customerNames[indexPath.row]
            cell?.textLabel?.text = customer.fullName
        }else{
            let owner = ownerNames[indexPath.row]
            cell?.textLabel?.text = owner.fullName
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
        }else{
            let c = DataStorage.getInstance().getAllOwners()
            let sc = c[indexPath.row]
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let personDetailsViewController = sb.instantiateViewController(identifier: "PersonDetailsViewController") as! PersonDetailsViewController
            personDetailsViewController.person = sc
            self.navigationController?.pushViewController(personDetailsViewController, animated: true)
        }
    }
}
