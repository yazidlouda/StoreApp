//
//  OrderSubmittedViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/22/21.
//

import UIKit

class OrderSubmittedViewController: UIViewController {
    @IBOutlet weak var truck: UIImageView!
    @IBOutlet weak var box: UIImageView!
    
    @IBOutlet weak var orderNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


//        let order = DBHelper.orderNum
    //    let index = orderNumberValue.index(orderNumberValue.startIndex, offsetBy: 8)
        
      //  orderNumber.text = String(orderNumberValue.prefix(upTo: index))
        
        boxAnimateUp()

        
        func boxAnimateUp() {
            UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
                self.box.transform = CGAffineTransform(translationX: 0, y: -50)
            }, completion: {_ in boxAnimateRight()})
        }
        
        func boxAnimateRight() {
            UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
                self.box.transform = CGAffineTransform(translationX: 90, y: -50)
                self.box.alpha = 0
            }, completion: {_ in truckAnimateRight()})
        }
        
        func truckAnimateRight() {
            UIView.animateKeyframes(withDuration: 1.25, delay: 0, animations: {
                self.truck.transform = CGAffineTransform(translationX: 400, y: 0)
            }, completion: {_ in truckAnimateLeft()})
        }
        
        func truckAnimateLeft() {
            UIView.animateKeyframes(withDuration: 1.25, delay: 0, animations: {
                self.truck.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { [self]_ in boxAnimateLeft()})
        }


        
        boxAnimateUp()
       
    }
    func boxAnimateUp() {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
            self.box.transform = CGAffineTransform(translationX: 0, y: -50)
        }, completion: { [self]_ in boxAnimateRight()})
    }
    
    func boxAnimateRight() {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
            self.box.transform = CGAffineTransform(translationX: 90, y: -50)
            self.box.alpha = 0
        }, completion: { [self]_ in truckAnimateRight()})
    }
    
    func truckAnimateRight() {
        UIView.animateKeyframes(withDuration: 1.25, delay: 0, animations: {
            self.truck.transform = CGAffineTransform(translationX: 400, y: 0)
        }, completion: { [self]_ in truckAnimateLeft()})
    }
    
    func truckAnimateLeft() {
        UIView.animateKeyframes(withDuration: 1.25, delay: 0, animations: {
            self.truck.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { [self]_ in boxAnimateLeft()})
    }
    
    func boxAnimateLeft() {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
            self.box.transform = CGAffineTransform(translationX: 0, y: -50)
            self.box.alpha = 1
        }, completion: { [self]_ in boxAnimateDown()})
    }
    
    func boxAnimateDown() {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
            self.box.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { [self]_ in boxAnimateUp()})
    }
    @IBAction func returnClicked(_ sender: UIButton) {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabBar = mainBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true)
    }
    
    
}
