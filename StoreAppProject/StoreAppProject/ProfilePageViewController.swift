//
//  ProfilePageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/4/21.
//

import UIKit

class ProfilePageViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
               
        cell.orderNumber.text = "1"
               return cell
    }
    
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var accountBalance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = DBHelper.currentUser
       // phoneNumber.text = String(userData.phoneNumber)
       //  accountBalance.text = String("$\(userData.giftCardBalance)")
        
    }
}
