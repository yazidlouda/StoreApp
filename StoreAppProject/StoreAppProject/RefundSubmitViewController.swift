//
//  RefundSubmitViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/22/21.
//

import UIKit

class RefundSubmitViewController: UIViewController {
    var total : Double = 0.00
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var refundTotal: UILabel!
    var refundTotalAmount = ProfilePageViewController.refundAmount
    override func viewDidLoad() {
        super.viewDidLoad()
        orderNumberLabel.text = ProfilePageViewController.selectedOrderNumber
        refundTotal.text = String(format: "$%.2f", ProfilePageViewController.refundAmount)
    }

    @IBAction func refundSubmitted(_ sender: Any) {
        DBHelper.inst.updateAccountBalance(DBHelper.currentUser, refundTotalAmount)
        DBHelper.inst.deleteOrder(ProfilePageViewController.fullOrderId!)
    }
    
}
