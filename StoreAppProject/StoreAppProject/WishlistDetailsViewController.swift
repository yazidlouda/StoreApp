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
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        print(wishListInstance.wishListItems as Any)
        tableView.rowHeight = 150
        // Do any additional setup after loading the view.
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
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.itemImage.image = wishListInstance.wishListItems[indexPath.row].image
        cell.itemName.text = wishListInstance.wishListItems[indexPath.row].name
        cell.itemDescription.text = wishListInstance.wishListItems[indexPath.row].description
        cell.itemPrice.text = "$" + wishListInstance.wishListItems[indexPath.row].price.description
        return cell
    }
    
    
}

extension WishlistDetailsViewController: UITableViewDelegate {
    

}
