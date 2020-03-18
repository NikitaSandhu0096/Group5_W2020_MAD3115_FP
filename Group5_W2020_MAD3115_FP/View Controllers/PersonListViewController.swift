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
    
    @IBAction func segPerson(_ sender: UISegmentedControl) {
        tblPersons.reloadData()
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
            cell?.textLabel?.text = customer.firstName
        }else{
            let owner = ownerNames[indexPath.row]
            cell?.textLabel?.text = owner.firstName
        }

        return cell!
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let c = DataStorage.getInstance().getAllCustomers()
//        let sc = c[indexPath.row]
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let showBillDetailsVC = sb.instantiateViewController(identifier: "showBillDetailsVC") as! ShowBillDetailsViewController
//        showBillDetailsVC.customer = sc
//        self.navigationController?.pushViewController(showBillDetailsVC, animated: true)
//    }
}
