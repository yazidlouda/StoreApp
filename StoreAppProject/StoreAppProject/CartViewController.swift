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
        //let p = parent as! TabBarViewController
        //cartData = Array(DBHelper.cartSet)
        //cartData = Array(DBHelper.cartSet)
        print("data: ", cartData)
        //tableView.reloadData()
        //print("DBHelper.cartSet: ", DBHelper.cartSet)
        // Do any additional setup after loading the view.
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
    
    /*
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
        
    }*/

}
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


        //let data = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
        return cartData.count

//         let data = DBHelper.inst.getCustomer(withEmailID: "y")

        
//         return data.cart!.count
        
        

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell

        cell.itemImage1.image = cartData[indexPath.row].image
        cell.itemName1.text = cartData[indexPath.row].name
        cell.itemPrice.text = cartData[indexPath.row].price.description
        cell.itemDescription.text = cartData[indexPath.row].info


//         var array = Array(db.cart!)
//         cell.itemImage1.image = array[indexPath.row].image
//         cell.itemName1.text = array[indexPath.row].name
//             cell.itemPrice.text = array[indexPath.row].price.description
//             cell.itemDescription.text = array[indexPath.row].info
           
           
     

        return cell
    }
    
    
    @IBAction func checkout(_ sender: Any) {
        let product = DBHelper.inst.getAllProducts()
        for i in product {
           
//                orderInstance.orderItems.append(i)
      
                
            }
        
       
    }
    

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            var array = Array(self.db.cart!)
            tableView.beginUpdates()
            
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            tableView.endUpdates()
//            totalNoShipp.text = "$" + cartInstance.getTotal().description
//            if(cartInstance.getTotal() >= 50.00){
//                shipping.text = "$" + 20.00.description
//                total.text = "$" + (cartInstance.getTotal() + 20.00).description
//            }
//            if(cartInstance.getTotal() < 50.00){
//                shipping.text = "$" + 10.00.description
//                total.text = "$" + (cartInstance.getTotal() + 10.00).description
//            }
//            if(cartInstance.getTotal() == 0.00){
//                shipping.text = "$" + 0.00.description
//                total.text = "$" + (cartInstance.getTotal() + 0.00).description
//            }
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
