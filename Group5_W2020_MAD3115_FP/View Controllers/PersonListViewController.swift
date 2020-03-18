//
//  PersonListViewController.swift
//  Group5_W2020_MAD3115_FP
//
//  Created by Nikita Sandhu on 2020-03-18.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController {

    @IBOutlet weak var tblPersons: UITableView!
    var customerNames : [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customerNames = DataStorage.getInstance().getAllCustomers()
        tblPersons.reloadData()
    }
    
}

extension PersonListViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell")
    
        let customer = customerNames[indexPath.row]

        cell?.textLabel?.text = customer.firstName

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
