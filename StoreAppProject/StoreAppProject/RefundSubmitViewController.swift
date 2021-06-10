//
//  RefundSubmitViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/22/21.
//

import UIKit

class RefundSubmitViewController: UIViewController {
    static var order = ""
    static var refund = 0.00
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var refundAmount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        orderNumber.text = RefundSubmitViewController.order
        // Do any additional setup after loading the view.
        if (RefundSubmitViewController.refund < 50.00){
            refundAmount.text = "$" + (RefundSubmitViewController.refund + 10).description
        }else if (RefundSubmitViewController.refund > 50.00){
            refundAmount.text = "$" + (RefundSubmitViewController.refund + 20).description
        }
        
    }
    @IBAction func submitRefund(_ sender: Any) {
        
        ProfilePageViewController.delete = RefundSubmitViewController.order
        
        if (RefundSubmitViewController.refund < 50.00){
            ProfilePageViewController.balance = "$" + (RefundSubmitViewController.refund + 10).description
        }else if (RefundSubmitViewController.refund > 50.00){
            ProfilePageViewController.balance = "$" + (RefundSubmitViewController.refund + 20).description
        }
        
    }
    


}
