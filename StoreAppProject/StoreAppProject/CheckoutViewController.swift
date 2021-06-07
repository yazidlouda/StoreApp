//
//  CheckoutViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var index: Int?
    @IBOutlet weak var tableView: UITableView!
    var orderInstance = Orders.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    

 

}
extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderInstance.orderItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell", for: indexPath) as! CheckoutTableViewCell
        cell.name.text = orderInstance.orderItems[indexPath.item].name
        cell.price.text = orderInstance.orderItems[indexPath.item].price.description
       
        cell.index = indexPath.row
       
        return cell
    }
   
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController =  storyboard?.instantiateViewController(identifier: "CheckoutViewController") as? CheckoutViewController
        
        viewController?.index  = indexPath.item
        
        let haptic = UIImpactFeedbackGenerator(style: .soft)
        haptic.impactOccurred()
        
        self.present(viewController!, animated: true, completion: nil)
    }
//    @IBAction func submitOrder(_ sender: Any) {
//
//        let product = ProductViewController().product[index!]
//        if !orderInstance.orderItems.contains(where: {$0.name == product.name}){
//
//            orderInstance.orderItems.append(product)
//        }
//
//    }
}

extension CheckoutViewController: UITableViewDelegate {
    
}
