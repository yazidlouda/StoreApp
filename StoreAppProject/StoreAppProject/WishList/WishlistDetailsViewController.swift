//
//  WishlistDetailsViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class WishlistDetailsViewController: UIViewController {
    var wishlistData = Array(DBHelper.wishlistSet)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        //print(wishListInstance.wishListItems as Any)
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
        return wishlistData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "WishListTableViewCell", for: indexPath) as! WishListTableViewCell
        cell.itemImage.image = wishlistData[indexPath.row].image
        cell.name.text = wishlistData[indexPath.row].name
        cell.itemDescription.text = wishlistData[indexPath.row].description
        cell.itemPrice.text = "$" + wishlistData[indexPath.row].price.description
        //cell.index = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            DBHelper.inst.deleteFromWishlist(productID: wishlistData[indexPath.row].id!)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            tableView.endUpdates()
           
        }
    }
    
}

extension WishlistDetailsViewController: UITableViewDelegate {
    

}
