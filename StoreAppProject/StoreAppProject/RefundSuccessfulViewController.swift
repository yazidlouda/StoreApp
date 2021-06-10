//
//  RefundSuccessfulViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/22/21.
//

import UIKit

class RefundSuccessfulViewController: UIViewController {
    @IBOutlet weak var money: UIImageView!
    @IBOutlet weak var wallet: UIImageView!
    @IBOutlet weak var orderNumberLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        orderNumberLabel.text = ProfilePageViewController.selectedOrderNumber
        moneyAnimateLeft()
        
        func moneyAnimateLeft() {
            UIView.animateKeyframes(withDuration: 0.85, delay: 0.5, animations: {
                self.money.transform = CGAffineTransform(translationX: -100, y: 0)

                self.money.transform = CGAffineTransform(translationX: -100, y: 100)

                self.money.alpha = 0
            }, completion: {_ in moneyAnimateRight()})
        }
        
        func moneyAnimateRight() {
            UIView.animateKeyframes(withDuration: 0.78, delay: 0.25, animations: {
                self.money.transform = CGAffineTransform(translationX: 0, y: 100)
//                self.money.transform = CGAffineTransform(rotationAngle: 30)
                self.money.transform = CGAffineTransform(translationX: 0, y: 0)

                self.money.alpha = 1
            }, completion: {_ in moneyAnimateLeft()})
        }
    }
    
    @IBAction func returnSelected(_ sender: UIButton) {
        
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)

        let profilePage = mainBoard.instantiateViewController(withIdentifier: "profilePage") as! ProfilePageViewController
        profilePage.modalPresentationStyle = .fullScreen
        self.present(profilePage, animated: true, completion: nil)
        
    }
    
    
}
