//
//  WishlistDetailsViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class WishlistDetailsViewController: UIViewController {
    var wishListInstance = WishList.sharedInstance
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        print(wishListInstance.wishListItems as Any)
        tableView.rowHeight = 150
        // Do any additional setup after loading the view.
        //CartTableViewCell().removeFromCart.isHidden = true
    }
    

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           tableView.reloadData()
        
    }

}
extension WishlistDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishListInstance.wishListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "WishListTableViewCell", for: indexPath) as! WishListTableViewCell
        cell.itemImage.image = wishListInstance.wishListItems[indexPath.row].image
        cell.name.text = wishListInstance.wishListItems[indexPath.row].name
        cell.itemDescription.text = wishListInstance.wishListItems[indexPath.row].description
        cell.itemPrice.text = "$" + wishListInstance.wishListItems[indexPath.row].price.description
        cell.index = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            wishListInstance.wishListItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            tableView.endUpdates()
           
        }
    }
    
}

extension WishlistDetailsViewController: UITableViewDelegate {
    

}
