//
//  ItemViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class ItemViewController: UIViewController {

    
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
    var WishListInst = WishList.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        itemname.text = name
        itemImage.image = image
        itemDescription.text = itemInfo
        itemPrice.text = String(price!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToCart(_ sender: Any) {
        let product = inventory[index!]
        let haptic = UINotificationFeedbackGenerator()

        if !cartInstance.cartItems.contains(where: {$0.name == product.name}) {
        cartInstance.cartItems.append(product)
            haptic.notificationOccurred(.success)
        } else {
            print("Product is already added to Cart")
            haptic.notificationOccurred(.error)
        }
        
    }
    
    @IBAction func addToWishList(_ sender: Any) {
        let product = inventory[index!]
        let haptic = UINotificationFeedbackGenerator()

        if !WishListInst.wishListItems.contains(where: {$0.name == product.name}) {
            WishListInst.wishListItems.append(product)
            haptic.notificationOccurred(.success)
        } else {
            print("Product is already added to wishlist")
            haptic.notificationOccurred(.error)
        }
    }
    

}
