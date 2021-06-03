//
//  DBTestViewController.swift
//  StoreAppProject
//
//  Created by admin on 6/1/21.
//

import UIKit

class DBTestViewController: UIViewController {
    var clothingDept : Department?
    override func viewDidLoad() {
        super.viewDidLoad()
        DBHelper.inst.addDepartment(name:"clothing")
        clothingDept = DBHelper.inst.getDepartment(name:"clothing")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func populateDB(_ sender: Any) {
        for item in inventory {
            DBHelper.inst.addProduct(name: item.name, price: item.price, info:item.description, image: item.image, department: clothingDept!)
        }
        
    }
    @IBAction func deletePaymentMethods(_ sender: Any) {
        DBHelper.inst.clearPaymentMethods(username: "bcrits")
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
