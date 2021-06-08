//
//  TabBarViewController.swift
//  StoreAppProject
//
//  Created by Home on 6/4/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    var cartData = Array(DBHelper.cartSet)
    var cartQuantityData = DBHelper.cartItemQuantities
    var cartSubtotalData = DBHelper.cartItemSubtotals
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
