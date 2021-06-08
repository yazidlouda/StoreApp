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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //boxAnimateUp()
        
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
            }, completion: {_ in boxAnimateLeft()})
        }
        
        func boxAnimateLeft() {
            UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
                self.box.transform = CGAffineTransform(translationX: 0, y: -50)
                self.box.alpha = 1
            }, completion: {_ in boxAnimateDown()})
        }
        
        func boxAnimateDown() {
            UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
                self.box.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: {_ in boxAnimateUp()})
        }
    }
}
