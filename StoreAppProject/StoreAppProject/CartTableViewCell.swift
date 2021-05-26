//
//  CartTableViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var removeFromWishlist: UIButton!
    @IBOutlet weak var removeFromCart: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    var index: Int?
    
    var cartInstance = Cart.sharedInstance
    var WishListInst = WishList.sharedInstance
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func removeFromCart(_ sender: Any) {
        let product = inventory[index!]
        let haptic = UINotificationFeedbackGenerator()

        if !cartInstance.cartItems.contains(where: {$0.name == product.name}) {
            cartInstance.cartItems.remove(at: index!)
            haptic.notificationOccurred(.success)
            CartViewController()
           
        } else {
            print("Product can not be deleted from Cart")
            haptic.notificationOccurred(.error)
        }
    }
    
    @IBAction func removeFromWishList(_ sender: Any) {
        let product = inventory[index!]
        let haptic = UINotificationFeedbackGenerator()

        if !WishListInst.wishListItems.contains(where: {$0.name == product.name}) {
            WishListInst.wishListItems.remove(at: index!)
            haptic.notificationOccurred(.success)
           // CartViewController().tableView.reloadData()
        } else {
            print("Product can not be deleted from wishlist")
            haptic.notificationOccurred(.error)
        }
    }
}
