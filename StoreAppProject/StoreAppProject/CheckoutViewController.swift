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
    
    var shippingOptions = ["Standard", "Expedited +$10.00"]
    var paymentOptions = ["Credit Card", "Bank Account"]
    
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
    @IBAction func submitOrder(_ sender: Any) {
        
        //DBHelper.inst.checkout(paymentMethodID: cus.paymentMethods, forCustomerWithEmailID: DBHelper.currentUser)
    }
}

