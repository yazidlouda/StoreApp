//
//  CartViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class CartViewController: UIViewController {
    var cartInstance = Cart.sharedInstance
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shipping: UILabel!
    @IBOutlet weak var totalNoShipp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        print(cartInstance.cartItems as Any)
        tableView.rowHeight = 150
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           tableView.reloadData()
        totalNoShipp.text = "$" + cartInstance.getTotal().description
        if(cartInstance.getTotal() >= 50.00){
            shipping.text = "$" + 20.00.description
            total.text = "$" + (cartInstance.getTotal() + 20.00).description
        }
        if(cartInstance.getTotal() < 50.00){
            shipping.text = "$" + 10.00.description
            total.text = "$" + (cartInstance.getTotal() + 10.00).description
        }
        if(cartInstance.getTotal() == 0.00){
            shipping.text = "$" + 0.00.description
            total.text = "$" + (cartInstance.getTotal() + 0.00).description
        }
        
    }

}
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartInstance.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.itemImage.image = cartInstance.cartItems[indexPath.row].image
        cell.itemName.text = cartInstance.cartItems[indexPath.row].name
        cell.itemDescription.text = cartInstance.cartItems[indexPath.row].description
        cell.itemPrice.text = "$" + cartInstance.cartItems[indexPath.row].price.description
        cell.index = indexPath.row
        return cell
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
}

extension CartViewController: UITableViewDelegate {
    
}
