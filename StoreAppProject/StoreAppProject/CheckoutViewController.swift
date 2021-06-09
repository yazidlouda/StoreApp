//
//  CheckoutViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class CheckoutViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var shippingAddressEntry: UITextField!
    @IBOutlet weak var paymentOptionPicker: UIPickerView!
    @IBOutlet weak var shippingOptionPicker: UIPickerView!
    let db = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
    @IBOutlet weak var orderTotal: UILabel!
    var shippingOptions = ["Standard", "Expedited +$10.00"]
    var paymentOptions = ["Credit Card", "Bank Account"]
    
    override func viewWillAppear(_ animated: Bool) {
       
        
           
            orderTotal.text = db.cartTotal.description
            if(db.cartTotal >= 50.00){
                
                self.orderTotal.text = String(format: "$%.2f", db.cartTotal + 20.00)
            }
            if(db.cartTotal < 50.00){
               
                self.orderTotal.text = String(format: "$%.2f", 10.00)
            }
            if(db.cartTotal == 0.00){
                
                self.orderTotal.text = String(format: "$%.2f", db.cartTotal + 0.00)
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
       
        if pickerView.tag == 1 {
            return shippingOptions.count
        } else {
            return paymentOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
       
        if pickerView.tag == 1 {
            
            return paymentOptions[row]
        } else {
            return shippingOptions[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch [row, pickerView.tag] {
        case [0, 2]:
            if(db.cartTotal >= 50.00){

                self.orderTotal.text = String(format: "$%.2f", db.cartTotal + 20.00)
            }
            if(db.cartTotal < 50.00){

                self.orderTotal.text = String(format: "$%.2f", db.cartTotal + 10)
            }
            print("item one",row)
        case [1, 2]:

            if(db.cartTotal >= 50.00){

                self.orderTotal.text = String(format: "$%.2f", db.cartTotal + 30.00)
            }
            if(db.cartTotal < 50.00){

                self.orderTotal.text = String(format: "$%.2f", db.cartTotal + 20.00)
            }
            
            
            print("item two",row)
        default:
            print("1")
        }
    }
    @IBAction func submitOrder(_ sender: Any) {
        if shippingAddressEntry.text == nil{
            let alert = UIAlertController(title: "Shipping Address missing", message: "Enter a shipping adress.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        }else{
            DBHelper.inst.checkout()
            let mainBoard = UIStoryboard(name: "Main", bundle: nil)
            let orderSubmittedController = mainBoard.instantiateViewController(withIdentifier: "orderSubmittedController") as! OrderSubmittedViewController
            orderSubmittedController.modalPresentationStyle = .fullScreen
            self.present(orderSubmittedController, animated: true)
        }
        
    }
    
  
}

