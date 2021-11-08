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
                
                self.orderTotal.text = "$" + (db.cartTotal + 20.00).description
            }
            if(db.cartTotal < 50.00){
               
                self.orderTotal.text = "$" + (db.cartTotal + 10.00).description
            }
            if(db.cartTotal == 0.00){
                
                self.orderTotal.text = "$" + (db.cartTotal + 0.00).description
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
            
            return shippingOptions[row]
        } else {
            return paymentOptions[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            if(db.cartTotal >= 50.00){

                self.orderTotal.text = "$" + (db.cartTotal + 20.00).description
            }
            if(db.cartTotal < 50.00){

                self.orderTotal.text = "$" + (db.cartTotal + 10.00).description
            }
            print("item one",row)
        case 1:

            if(db.cartTotal >= 50.00){

                self.orderTotal.text = "$" + (db.cartTotal + 30.00).description
            }
            if(db.cartTotal < 50.00){

                self.orderTotal.text = "$" + (db.cartTotal + 20.00).description
            }
            
            
            print("item two",row)
        default:
            print("1")
        }
    }
    @IBAction func submitOrder(_ sender: Any) {

        
            DBHelper.inst.checkout()
        

        
    }
    
  
}

