//
//  FilterViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/29/21.
//

import UIKit




//MARK: - Main
class FilterViewController: UIViewController {
    static var sort : String?
    
   
  
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func lowToHigh(_ sender: Any) {
        FilterViewController.sort = "low"
        let quiz = self.storyboard?.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        quiz.modalPresentationStyle = .fullScreen
        self.present(quiz, animated: true, completion: nil)
      
    }
    @IBAction func highToLow(_ sender: Any) {
        FilterViewController.sort = "high"
        let quiz = self.storyboard?.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        quiz.modalPresentationStyle = .fullScreen
        self.present(quiz, animated: true, completion: nil)
        
    }
}
