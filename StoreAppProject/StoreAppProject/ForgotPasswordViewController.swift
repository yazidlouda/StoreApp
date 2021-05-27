//
//  ForgotPasswordViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/21/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submit(_ sender: Any) {
        let data: Customer
        let alert: UIAlertController
        if DBHelper.found == 0 {
            warningLabel.text = "Username not found"
            username.text = ""
            return
        } else {
            warningLabel.text = ""
            data = DBHelper.inst.getCustomer(withEmailID: username.text!)
            // create the alert
            alert = UIAlertController(title: "Password Request", message: "Your password is \(data.password!)! Thank you for signing up with us.", preferredStyle: UIAlertController.Style.alert)
        
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
            // show the alert
            self.present(alert, animated: true, completion: nil)
            username.text = ""
        }
    }

}
