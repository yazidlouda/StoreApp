//
//  AddPaymentOptionViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class AddPaymentOptionViewController: UIViewController, UITextFieldDelegate {
    var bankVC : BankViewController?
    var cardVC : CardViewController?
    var username : String = "bcrits"
    var phone : Int64?
    var expDate : DateComponents?
    @IBOutlet weak var allFieldsLabel: UILabel!
    var isValidDate : Bool = false
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
        allFieldsLabel.isHidden = true
        self.bankVC = bankVC
        self.cardVC = cardVC
        cardView.isHidden = true
        bankView.isHidden = false
        var today = Date()
        self.expDate = Calendar.current.dateComponents([.month, .year], from: today)
        self.cardVC?.expDate.delegate = self
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
        var numData : [String:Int64] = [:]
        var firstName : String = ""
        var lastName : String = ""
        //var expDate : DateComponents
        switch type {
        case .BankAccount:
            if (bankVC?.fName.text == "" || bankVC?.lName.text == "" || bankVC?.accountNum.text == "" || bankVC?.routingNum.text == "") {
                allFieldsLabel.isHidden = false
                print("empty field")
            } else {
            firstName = (bankVC?.fName.text)!
            lastName = (bankVC?.lName.text)!
            numData["accountNum"] = Int64((bankVC?.accountNum.text)!)!
            numData["routingNum"] = Int64((bankVC?.routingNum.text)!)!
            if phone != nil {
                DBHelper.inst.addBankAccount(firstName: firstName, lastName: lastName, numberData: numData, forCustomerWithPhone: phone!)
            } else if (username != nil) {
                print("Username found, DB call made")
                DBHelper.inst.addBankAccount(firstName: firstName, lastName: lastName, numberData: numData, forCustomerWithEmailID: username)
            } else {
                print("no username or phone data found")
            }
            }
        case .Card:
            if (cardVC?.fName.text == "" || cardVC?.lName.text == "" || cardVC?.cvc.text == "" || cardVC?.zip.text == "" || cardVC?.expDate.text == "") {
                allFieldsLabel.isHidden = false
                print("empty field")
            } else {
            firstName = (cardVC?.fName.text)!
            lastName = (cardVC?.lName.text)!
            numData["cardNum"] = Int64((cardVC?.cardNum.text)!)!
            numData["cvc"] = Int64((cardVC?.cvc.text)!)!
            numData["zip"] = Int64((cardVC?.zip.text)!)!
            if (phone != nil && isValidDate) {
                DBHelper.inst.addCard(firstName: firstName, lastName: lastName, numberData: numData, expDate: self.expDate ?? DateComponents(), forCustomerWithPhone: phone!)
            } else if (username != nil && isValidDate) {
                //print(expDate)
                DBHelper.inst.addCard(firstName: firstName, lastName: lastName, numberData: numData, expDate: self.expDate ?? DateComponents(), forCustomerWithEmailID: username)
            } else {
                print("card not added")
            }
            }
        
            
        }
        /*
        PaymentMethod.methods.append(paymentmethod)
        var methods = PaymentMethod.methods
        for method in methods {
            print(method.firstName, method.lastName, method.accountNum, method.routingNum, method.cardNum, method.cvc, method.zip, method.expDate)
            */
        print(DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser).paymentMethods)
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text, let r = Range(range, in: oldText) else {
            return true
        }
        let updatedText = oldText.replacingCharacters(in: r, with: string)

        if string == "" {
            if updatedText.count == 2 {
                textField.text = "\(updatedText.prefix(1))"
                return false
            }
        } else if updatedText.count == 1 {
            if updatedText > "1" {
                return false
            }
        } else if updatedText.count == 2 {
            if updatedText <= "12" { //Prevent user to not enter month more than 12
                textField.text = "\(updatedText)/" //This will add "/" when user enters 2nd digit of month
            }
            return false
        } else if updatedText.count == 5 {
            self.expDateValidation(dateStr: updatedText)
        } else if updatedText.count > 5 {
            return false
        }

        return true
    }
    
    func expDateValidation(dateStr:String) {

        let currentYear = Calendar.current.component(.year, from: Date()) % 100   // This will give you current year (i.e. if 2019 then it will be 19)
        let currentMonth = Calendar.current.component(.month, from: Date()) // This will give you current month (i.e if June then it will be 6)

        let enteredYear = Int(dateStr.suffix(2)) ?? 0 // get last two digit from entered string as year
        let enteredMonth = Int(dateStr.prefix(2)) ?? 0 // get first two digit from entered string as month
        print(dateStr) // This is MM/YY Entered by user

        if enteredYear > currentYear {
            if (1 ... 12).contains(enteredMonth) {
                print("Entered Date Is Right")
                isValidDate = true
                expDate = DateComponents(calendar: Calendar.current, year: (2000 + enteredYear), month: enteredMonth, day: 1)
            } else {
                print("Entered Date Is Wrong")
            }
        } else if currentYear == enteredYear {
            if enteredMonth >= currentMonth {
                if (1 ... 12).contains(enteredMonth) {
                   print("Entered Date Is Right")
                    isValidDate = true
                    expDate = DateComponents(calendar: Calendar.current, year: currentYear, month: enteredMonth, day: 1)
                } else {
                   print("Entered Date Is Wrong")
                }
            } else {
                print("Entered Date Is Wrong")
            }
        } else {
           print("Entered Date Is Wrong")
        }

    }
    
}
