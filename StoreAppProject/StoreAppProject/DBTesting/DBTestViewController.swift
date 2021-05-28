//
//  DBTestViewController.swift
//  StoreAppProject
//
//  Created by admin on 5/28/21.
//

import UIKit

class DBTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func populateDB(_ sender: Any) {
        for item in inventory {
            DBHelper.inst.addProduct(name: item.name, price: item.price, info: item.description)
        }
        
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
