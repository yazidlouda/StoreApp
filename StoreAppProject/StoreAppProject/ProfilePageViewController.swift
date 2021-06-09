//
//  ProfilePageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/4/21.
//

import UIKit

class ProfilePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var trackButton: UITableView!
    @IBOutlet weak var refundButton: UITableView!
    
    
    let userData : Customer = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = DBHelper.currentUser
        phoneNumber.text = String(userData.phoneNumber)
        accountBalance.text = String("$\(userData.giftCardBalance)")
//        print(DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser))
        print(userData)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        userData.orders?.count ?? 0
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell
        
        cell.textLabel!.text = "textData[indexPath.row]"
        return cell
    }
}
