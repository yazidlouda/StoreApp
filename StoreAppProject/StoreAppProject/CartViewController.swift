//
//  CartViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    
    let db = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
    var cartInstance = Cart.sharedInstance
    var cartData = Array(DBHelper.cartSet)
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shipping: UILabel!
    @IBOutlet weak var totalNoShipp: UILabel!

   
    var Products : [Product]?
    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if DBHelper.isLoggedIn == true {
            signInButton.setTitle("Sign Out", for: .normal)
        } else {
            signInButton.setTitle("Sign In", for: .normal)
        }
   


        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 150
        tableView.reloadData()

        print("data: ", cartData)
    }
    
    @IBAction func checkoutClicked(_ sender: UIButton) {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)

        let loginPage = mainBoard.instantiateViewController(withIdentifier: "loginPage") as! LoginPageViewController
        loginPage.modalPresentationStyle = .fullScreen
        
        let checkoutPage = mainBoard.instantiateViewController(withIdentifier: "checkoutPage") as! CheckoutViewController
        checkoutPage.modalPresentationStyle = .fullScreen
        
        if DBHelper.isLoggedIn == true {
            self.tabBarController?.present(checkoutPage, animated: true, completion: nil)
            
        } else {
            self.tabBarController?.present(loginPage, animated: true, completion: nil)
        }
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        var total = DBHelper.cartTotal
        totalNoShipp.text = "$" + total.description
        if(total >= 50.00){
            shipping.text = "$" + 20.00.description
            self.total.text = "$" + (total + 20.00).description
        }
        if(total < 50.00){
            shipping.text = "$" + 10.00.description
            self.total.text = "$" + (total + 10.00).description
        }
        if(total == 0.00){
            shipping.text = "$" + 0.00.description
            self.total.text = "$" + (total + 0.00).description
        }
        
    }

}
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


        //let data = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
        return cartData.count


        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell

        cell.itemImage1.image = cartData[indexPath.row].image
        cell.itemName1.text = cartData[indexPath.row].name
        cell.itemDescription.text = cartData[indexPath.row].info
        //cell.quantity.text = String(DBHelper.cartItemQuantities[cartData[indexPath.row].id!]!)
        
//        if (DBHelper.cartItemQuantities[cartData[indexPath.row].id!]! > 1) {
//            cell.itemPrice.text = String(DBHelper.cartItemSubtotals[cartData[indexPath.row].id!]!)
//        } else {
            cell.itemPrice.text = cartData[indexPath.row].price.description
//
//        }


     

        return cell
    }
    
    

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            //var array = Array(self.db.cart!)
            tableView.beginUpdates()
            DBHelper.inst.deleteFromCart(productID: cartData[indexPath.row].id!)
            cartData.remove(at: indexPath.row)
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

extension CartViewController: UITableViewDelegate {
    
}
