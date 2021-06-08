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

    
    @IBOutlet weak var rat: CosmosView!

    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemname: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!

    var image: UIImage?
    var name: String?
    var itemInfo: String?
    var index: Int?
    var price: Double?
    var cartInstance = Cart.sharedInstance

    

    var rat1: Double?
//    var cartInstance = Cart.sharedInstance


    var WishListInst = WishList.sharedInstance
    static var dt: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        itemname.text = product?.name
        itemImage.image = product?.image
        itemDescription.text = product?.info
        itemPrice.text = String(product!.price)
        

   
    }
   
    @IBAction func addToCart(_ sender: Any) {

        //let dashboard = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        //dashboard.modalPresentationStyle = .fullScreen
        
        
        DBHelper.inst.addToCart(productID: (product?.id)!, quantity: 1)

    }
    
  
//        self.present(dashboard, animated: true, completion: nil)
        

        
       // self.presentingViewController?.dismiss(animated: true, completion: nil)
    
  




}
