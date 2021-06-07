//
//  ItemViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit
import Cosmos
class ItemViewController: UIViewController {


    var username : String?
    var phone : Int64?
    var product : Product?
    var index: Int?
    
    @IBOutlet weak var rat: CosmosView!

    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemname: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    static var id : UUID?

    var rat1: Double?
    var cartInstance = Cart.sharedInstance

    var WishListInst = WishList.sharedInstance
    static var dt: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemname.text = product?.name
        itemImage.image = product?.image
        itemDescription.text = product?.info
        itemPrice.text = String(product!.price)
        //ItemViewController.id = product?.id

   
    }
   
    @IBAction func addToCart(_ sender: Any) {

        let dashboard = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        dashboard.modalPresentationStyle = .fullScreen

        self.present(dashboard, animated: true, completion: nil)
        let product = DBHelper.inst.getAllProducts()
        for i in product{
            DBHelper.inst.addToCart(productID: i.id!, quantity: 1, forCustomerWithEmailID: "y")
            if i.name == itemname.text {
              
                cartInstance.cartItems.append(i)
            }

        }
       
      
    }
  

    @IBAction func addToWishlist(_ sender: Any) {
        
        let dashboard = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        dashboard.modalPresentationStyle = .fullScreen
//        DBHelper.inst.addToCart(productID: ItemViewController.id!, quantity: 1, forCustomerWithEmailID: "yaz")
        self.present(dashboard, animated: true, completion: nil)
        let product = DBHelper.inst.getAllProducts()
        for i in product{
            DBHelper.inst.addToCart(productID: i.id!, quantity: 1, forCustomerWithEmailID: "y")
            if i.name == itemname.text {
                WishListInst.wishListItems.append(i)
            }

        }
       
      
        
    }
    


}
