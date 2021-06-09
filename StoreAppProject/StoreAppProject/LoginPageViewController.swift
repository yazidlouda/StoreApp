//
//  LoginPageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit


class LoginPageViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var warningLabel: UILabel!
    
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
    

    @IBAction func enter(_ sender: Any) {
        let mainBoard = UIStoryboard(name:"Main", bundle: nil)
        let tabBar = mainBoard.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
    }
  
    @IBAction func login(_ sender: Any) {
        var customer : Customer
        if let phone = Int(username.text!) {
            print(phone)
            customer = DBHelper.inst.getCustomer(withPhone: phone)
        } else {
            customer = DBHelper.inst.getCustomer(withEmailID: username.text ?? "")
        }
        
        print("current phone: ", customer.phoneNumber)
        print("current username: ", customer.username)
        let alert = UIAlertController(title: "Invalid Login", message: "Enter a correct username or password", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        

        if (DBHelper.found == 0) {
            if (customer.password == password.text!) {
                DBHelper.currentUser = username.text!
                DBHelper.isLoggedIn = true
                DBHelper.cartSet = customer.cart!
                DBHelper.cartTotal = customer.cartTotal
                print("customer's cart: ", customer.cart!)
                print("DBHelper.cartSet: ", DBHelper.cartSet)
                DBHelper.wishlistSet = customer.wishlist!
                DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
                DBHelper.cartItemQuantities = customer.cartItemQuantities!
                
                let mainBoard = UIStoryboard(name: "Main", bundle: nil)
                let tabBar = mainBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                tabBar.modalPresentationStyle = .fullScreen
                self.present(tabBar, animated: true)
                
            } else {
                present(alert, animated: true)
            }
        } else {
            present(alert, animated: true)
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

    
    
    
    
    

    

