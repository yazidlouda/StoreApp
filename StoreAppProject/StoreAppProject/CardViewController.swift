//
//  CardViewController.swift
//  StoreAppProject
//
//  Created by admin on 5/26/21.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var cardNum: UITextField!
    @IBOutlet weak var cvc: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var expDate: UITextField!
    @IBOutlet weak var allFields: UILabel!
    @IBOutlet weak var invalidDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        invalidDate.isHidden = true
        allFields.isHidden = true
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
