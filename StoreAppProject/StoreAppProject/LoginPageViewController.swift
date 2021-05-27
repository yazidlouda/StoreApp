//
//  LoginPageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit


class LoginPageViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var logo: UIImageView!

    var ud = UserDefaults.standard
    
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        password.delegate = self

        if (sw.isOn) { // if the switch is on, remember the last username/password combo entered and automatically enter it for the user
            username.text = ud.string(forKey: "username")
            password.text = ud.string(forKey: "username")
        }
        
        func animateRight() {
            UIView.animateKeyframes(withDuration: 0.1, delay: 3, animations: {
                self.logo.transform = CGAffineTransform(rotationAngle: 170)
            }, completion: {_ in animateLeft()})
        }
        func animateLeft() {
            UIView.animateKeyframes(withDuration: 0.1, delay: 0, animations: {
                self.logo.transform = CGAffineTransform(rotationAngle: 320)
            }, completion: {_ in animateCenter()})
        }
        func animateCenter() {
            UIView.animateKeyframes(withDuration: 0.1, delay: 0, animations: {
                self.logo.transform = CGAffineTransform(rotationAngle: 0)
            }, completion: {_ in animateRight()})
        }
    }
    
    @IBAction func login(_ sender: Any) {

        let cus = DBHelper.inst.getCustomer(withEmailID: username.text!)
        if (cus.username == nil || cus.password == nil){
            let alert = UIAlertController(title: "Wrong informations", message: "Enter a correct username or password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        if (username.text == cus.username! && password.text == cus.password!) { // Verifies that the user credentials are in the core data and lets the user login
           // let data = DBHelper.inst.getCustomer(withEmailID: username.text!)
    
            
            let dashboard = self.storyboard?.instantiateViewController(identifier: "dashboard") as! UserDashboardViewController
            dashboard.modalPresentationStyle = .fullScreen
            self.present(dashboard, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Wrong informations", message: "Enter a correct username or password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func rememberLogin(_ sender: UISwitch) {
        if (sw.isOn) {
            ud.set(sender.isOn, forKey: "mySwitchValue")
            ud.set(username.text, forKey: "username")
            ud.set(password.text, forKey: "password")
        } else {
            ud.removeObject(forKey: "username")
            ud.removeObject(forKey: "password")
        }

    }
    

}
