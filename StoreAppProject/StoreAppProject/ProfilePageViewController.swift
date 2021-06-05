//
//  ProfilePageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/4/21.
//

import UIKit

class ProfilePageViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = DBHelper.currentUser
    }
}
