//
//  OrderStatusViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/22/21.
//

import UIKit

class OrderStatusViewController: UIViewController {
    static var order = ""
    @IBOutlet weak var orderNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        orderNumber.text = OrderStatusViewController.order
        // Do any additional setup after loading the view.

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
