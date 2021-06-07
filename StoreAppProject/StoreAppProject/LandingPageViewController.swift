//
//  LandingPageViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class LandingPageViewController: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DBHelper.isLoggedIn == true {
            signInButton.setTitle("Sign Out", for: .normal)
        } else {
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
    
    @IBAction func profileClicked(_ sender: UIButton) {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let profilePage = mainBoard.instantiateViewController(withIdentifier: "profilePage") as! ProfilePageViewController
        profilePage.modalPresentationStyle = .fullScreen
        
        let loginPage = mainBoard.instantiateViewController(withIdentifier: "loginPage") as! LoginPageViewController
        loginPage.modalPresentationStyle = .fullScreen
        
        if DBHelper.isLoggedIn == true {
            self.tabBarController?.present(profilePage, animated: true, completion: nil)
        } else {
            self.tabBarController?.present(loginPage, animated: true, completion: nil)
        }
    }
    
    @IBAction func signoutClicked(_ sender: UIButton) {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let loginPage = mainBoard.instantiateViewController(withIdentifier: "loginPage") as! LoginPageViewController
        loginPage.modalPresentationStyle = .fullScreen
        
        if DBHelper.isLoggedIn == true {
            DBHelper.isLoggedIn = false
            self.tabBarController?.present(loginPage, animated: true, completion: nil)
        } else {
            self.tabBarController?.present(loginPage, animated: true, completion: nil)
        }
    }

}

