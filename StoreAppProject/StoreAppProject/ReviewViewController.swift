//
//  ReviewViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/7/21.
//

import UIKit
import Cosmos

class ReviewViewController: UIViewController {
    @IBOutlet weak var rat: CosmosView!
    @IBOutlet weak var comment: UITextView!
    var enteredComment : String = ""
    var product = DBHelper.currentProduct
    let date = Date()
    var rat1: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rat.settings.fillMode = .half
        rat.didFinishTouchingCosmos = {
            rate in
            self.rat1 = rate
            print(self.rat1!)
        }
    }

    @IBAction func submitReview(_ sender: UIButton) {
        enteredComment = comment.text
        DBHelper.inst.addReview(enteredComment, date, rat1!, product)
    }

}
