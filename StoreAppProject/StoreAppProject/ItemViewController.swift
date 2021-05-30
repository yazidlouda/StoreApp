//
//  ItemViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class ItemViewController: UIViewController {

    var username : String?
    var phone : Int64?
    var product : Product?
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemname: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    /*var image: UIImage?
    var name: String?
    var itemInfo: String?
    var index: Int?
    var price: Double?
    var cartInstance = Cart.sharedInstance*/
    var WishListInst = WishList.sharedInstance
    static var dt: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        itemname.text = product?.name
        itemImage.image = UIImage(named: "1")!
        itemDescription.text = product?.info
        itemPrice.text = String(product!.price)
        
    }
   
    @IBAction func addToCart(_ sender: Any) {
        /*let product = inventory[index!]
        let haptic = UINotificationFeedbackGenerator()

        if !cartInstance.cartItems.contains(where: {$0.name == product.name}) {
        cartInstance.cartItems.append(product)
            haptic.notificationOccurred(.success)
        } else {
            print("Product is already added to Cart")
            haptic.notificationOccurred(.error)
        }*/
        DBHelper.inst.addToCart(productID: (product?.id)!, quantity: 1, forCustomerWithEmailID: username!)
        var customer = DBHelper.inst.getCustomer(withEmailID: username!)
        print(customer.cart)
    }
    
    @IBAction func addToWishList(_ sender: Any) {
        /*let product = inventory[index!]
        let haptic = UINotificationFeedbackGenerator()

        if !WishListInst.wishListItems.contains(where: {$0.name == product.name}) {
            WishListInst.wishListItems.append(product)
            haptic.notificationOccurred(.success)
        } else {
            print("Product is already added to wishlist")
            haptic.notificationOccurred(.error)
        }*/
    }
    

}
