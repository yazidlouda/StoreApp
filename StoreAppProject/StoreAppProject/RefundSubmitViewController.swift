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
           
            refundAmount.text =  String(format: "$%.2f", RefundSubmitViewController.refund + 10)
        }else if (RefundSubmitViewController.refund > 50.00){
            refundAmount.text =  String(format: "$%.2f", RefundSubmitViewController.refund + 20)
        }
        
    }
    @IBAction func submitRefund(_ sender: Any) {
        
        ProfilePageViewController.delete = RefundSubmitViewController.order
        
        if (RefundSubmitViewController.refund < 50.00){
            ProfilePageViewController.balance =  String(format: "$%.2f", RefundSubmitViewController.refund + 10)
        }else if (RefundSubmitViewController.refund > 50.00){
            ProfilePageViewController.balance =  String(format: "$%.2f", RefundSubmitViewController.refund + 20)
        }
        
    }
    


}
