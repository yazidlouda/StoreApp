//
//  SignUpViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
//        let numAsText : String = phoneNumber.text
        let number : Int64 = Int64(phoneNumber.text!)!
        print(number)
          if (username.text!.isEmpty == false && password.text!.isEmpty == false) {

            DBHelper.inst.addCustomer( username: username.text!, password: password.text!, PhoneNumber: number)
              let alert = UIAlertController(title: "Signed Up", message: "Customer created.", preferredStyle: UIAlertController.Style.alert)
              
              // add an action (button)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
              
              // show the alert
//              self.present(alert, animated: true, completion: nil)
            let mainBoard = UIStoryboard(name:"Main", bundle: nil)
            let loginPage = mainBoard.instantiateViewController(withIdentifier: "loginPage") as! LoginPageViewController
            loginPage.modalPresentationStyle = .fullScreen
            self.present(loginPage, animated: true, completion: nil)
                  
          } else if (username.text!.isEmpty && password.text!.isEmpty) {
              let alert = UIAlertController(title: "Error.", message: "No account details provided. Account not created.", preferredStyle: UIAlertController.Style.alert)
              
              // add an action (button)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
              
              // show the alert
              self.present(alert, animated: true, completion: nil)
             // DBHelper.inst.deleteOneUser(username: "")
          }
          
          username.text = "" // reset the text fields to empty so the user can create another new user if they wish
          password.text = ""
        firstName.text = ""
        lastName.text = ""
        phoneNumber.text = ""

    }
    
  

}
