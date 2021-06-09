//
//  WishlistDetailsViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class WishlistDetailsViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    var wishListInstance = WishList.sharedInstance
    var products: [Product]?
    let db = DBHelper.inst.getCustomer(withEmailID: "y")

    var wishlistData = Array(DBHelper.wishlistSet)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DBHelper.isLoggedIn == true {
            signInButton.setTitle("Sign Out", for: .normal)
        } else {
            signInButton.setTitle("Sign In", for: .normal)
        }
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
        DBHelper.inst.deleteFromWishlist(productID: wishlistData[indexPath.row].id!)
        if editingStyle == .delete{
            tableView.beginUpdates()
            DBHelper.inst.deleteFromWishlist(productID: wishlistData[indexPath.row].id!)
            wishlistData.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            tableView.endUpdates()
           
        }
        
    }
    @IBAction func profileClicked(_ sender: UIButton) {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let profilePage = mainBoard.instantiateViewController(withIdentifier: "profilePage") as! ProfilePageViewController
        profilePage.modalPresentationStyle = .fullScreen
        
        let loginPage = mainBoard.instantiateViewController(withIdentifier: "loginPage") as! LoginPageViewController
        loginPage.modalPresentationStyle = .fullScreen
        
        if DBHelper.isLoggedIn == true {
            self.tabBarController?.present(profilePage, animated: true, completion: nil)
        } else {
            self.tabBarController?.present(loginPage, animated: true, completion: nil)
        }
    }
    
    @IBAction func signoutClicked(_ sender: UIButton) {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let loginPage = mainBoard.instantiateViewController(withIdentifier: "loginPage") as! LoginPageViewController
        loginPage.modalPresentationStyle = .fullScreen
        
        if DBHelper.isLoggedIn == true {
            DBHelper.cartSet = []
            DBHelper.cartItemSubtotals = [:]
            DBHelper.cartItemQuantities = [:]
            DBHelper.currentUser = ""
            DBHelper.found = 1
            DBHelper.isLoggedIn = false
            DBHelper.cartTotal = 0.0
            self.tabBarController?.present(loginPage, animated: true, completion: nil)
        } else {
            self.tabBarController?.present(loginPage, animated: true, completion: nil)
        }
    }
}

extension WishlistDetailsViewController: UITableViewDelegate {
    

}
