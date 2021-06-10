//
//  EnterAddressViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/9/21.
//

import UIKit

class EnterAddressViewController: UIViewController {
    @IBOutlet weak var streetAddressLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var zipcodeLabel: UITextField!
    @IBOutlet weak var savedNotificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addressSaveClicked(_ sender: UIButton) {
        
        CheckoutViewController.addressDisplayValue = "\(streetAddressLabel.text ?? ""), \(cityLabel.text ?? ""), \(stateLabel.text ?? ""), \(zipcodeLabel.text ?? "")"
        if streetAddressLabel.text == "" || cityLabel.text == "" || stateLabel.text == "" || zipcodeLabel.text == "" {
            CheckoutViewController.addressEntered = false
            savedNotificationLabel.textColor = .red
            savedNotificationLabel.text = "Fields cannot be blank"
        } else {
            savedNotificationLabel.text = "Address Info Saved"
            CheckoutViewController.addressEntered = true
            let mainBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let checkoutPage = mainBoard.instantiateViewController(withIdentifier: "checkoutPage") as! CheckoutViewController
            checkoutPage.modalPresentationStyle = .fullScreen
            present(checkoutPage, animated: true, completion: nil)
        }
    }
    
    
}
