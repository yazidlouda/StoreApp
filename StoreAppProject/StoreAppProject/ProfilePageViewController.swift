//
//  ProfilePageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/4/21.
//

import UIKit


class ProfilePageViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    var ordersIDs : Array<String> = []
    
    let userData : Customer = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
    
    @IBOutlet weak var accountBalance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = DBHelper.currentUser

        phoneNumber.text = String(userData.phoneNumber)
        accountBalance.text = String("$\(userData.giftCardBalance)")
        ordersIDs = DBHelper.inst.getAllUserOrders(username: DBHelper.currentUser)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersIDs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell

        cell.textLabel!.text = ordersIDs[indexPath.row]
        return cell

    }
}
