//
//  AddPaymentOptionViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class AddPaymentOptionViewController: UIViewController {
    var bankVC : BankViewController?
    var cardVC : CardViewController?
    @IBOutlet weak var bankView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    var method : PaymentMethod?
    var type : MethodType = MethodType.BankAccount
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let bankVC = children.first as? BankViewController else {
            fatalError("no BankViewController found")
        }
        guard let cardVC = children.last as? CardViewController else {
            fatalError("no CardViewController found")
        }
        self.bankVC = bankVC
        self.cardVC = cardVC
        cardView.isHidden = true
        bankView.isHidden = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            bankView.isHidden = false
            cardView.isHidden = true
            type = MethodType.BankAccount
        case 1:
            bankView.isHidden = true
            cardView.isHidden = false
            type = MethodType.Card
        default: print("")
        }
    }
    
    @IBAction func submit(_ sender: Any) {
        var paymentmethod = PaymentMethod(type: self.type)
        switch type {
        case .BankAccount:
            paymentmethod.firstName = (bankVC?.fName.text)!
            paymentmethod.lastName = (bankVC?.lName.text)!
            paymentmethod.accountNum = Int64((bankVC?.accountNum.text)!)!
            paymentmethod.routingNum = Int64((bankVC?.routingNum.text)!)!
        case .Card:
            paymentmethod.firstName = (cardVC?.fName.text)!
            paymentmethod.lastName = (cardVC?.lName.text)!
            paymentmethod.cardNum = Int64((cardVC?.cardNum.text)!)!
            paymentmethod.cvc = Int64((cardVC?.cvc.text)!)!
            paymentmethod.zip = Int64((cardVC?.zip.text)!)!
        }
        PaymentMethod.methods.append(paymentmethod)
        var methods = PaymentMethod.methods
        for method in methods {
            print(method.firstName, method.lastName, method.accountNum, method.routingNum, method.cardNum, method.cvc, method.zip, method.expDate)
            
        }
        self.presentingViewController?.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
