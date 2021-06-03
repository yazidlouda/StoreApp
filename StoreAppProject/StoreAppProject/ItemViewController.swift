//
//  ItemViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit
import Cosmos
class ItemViewController: UIViewController {

    
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
    var rat1: Double?
    var cartInstance = Cart.sharedInstance
    var WishListInst = WishList.sharedInstance
    static var dt: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        itemname.text = name
        itemImage.image = image
        itemDescription.text = itemInfo
        itemPrice.text = price?.description
        rat.rating = rat1!
    }
   
    @IBAction func addToCart(_ sender: Any) {
       
        let product = ProductViewController().product[index!]
        let product1 = ClothingViewController().clothing[index!]
        let product2 = KitchenViewController().kitchen[index!]
        let product3 = ToysViewController().toys[index!]
        let product4 = OutdoorViewController().outdoor[index!]
        let product5 = HomeGoodViewController().homeGood[index!]
        let product6 = UserDashboardViewController().popular[index!]
        let product7 = UserDashboardViewController().featured[index!]
        let product8 = UserDashboardViewController().deals[index!]
        
        
        if(ItemViewController.dt == "product"){
            //let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product.name}) {
            cartInstance.cartItems.append(product)
                //haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
              //  haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "clothing"){
            //let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product1.name}) {
            cartInstance.cartItems.append(product1)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "kitchen"){
           // let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product2.name}) {
            cartInstance.cartItems.append(product2)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
      
        if(ItemViewController.dt == "toys"){
           // let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product3.name}) {
            cartInstance.cartItems.append(product3)
              //  haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "outdoor"){
          //  let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product4.name}) {
            cartInstance.cartItems.append(product4)
            //    haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
              //  haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "homeGood"){
          //  let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product5.name}) {
            cartInstance.cartItems.append(product5)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
              //  haptic.notificationOccurred(.error)
            }
        }
        
        if(ItemViewController.dt == "popular"){
            //let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product6.name}) {
            cartInstance.cartItems.append(product1)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "featured"){
           // let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product7.name}) {
            cartInstance.cartItems.append(product2)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
      
        if(ItemViewController.dt == "deals"){
           // let haptic = UINotificationFeedbackGenerator()

            if !cartInstance.cartItems.contains(where: {$0.name == product8.name}) {
            cartInstance.cartItems.append(product3)
              //  haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
    }
    
    @IBAction func addToWishList(_ sender: Any) {
        let product = ProductViewController().product[index!]
        let product1 = ClothingViewController().clothing[index!]
        let product2 = KitchenViewController().kitchen[index!]
        let product3 = ToysViewController().toys[index!]
        let product4 = OutdoorViewController().outdoor[index!]
        let product5 = HomeGoodViewController().homeGood[index!]
        let product6 = UserDashboardViewController().popular[index!]
        let product7 = UserDashboardViewController().featured[index!]
        let product8 = UserDashboardViewController().deals[index!]
        if(ItemViewController.dt == "product"){
            //let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product.name}) {
                WishListInst.wishListItems.append(product)
                //haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
              //  haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "clothing"){
            //let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product1.name}) {
                WishListInst.wishListItems.append(product1)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "kitchen"){
           // let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product2.name}) {
                WishListInst.wishListItems.append(product2)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
      
        if(ItemViewController.dt == "toys"){
           // let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product3.name}) {
                WishListInst.wishListItems.append(product3)
              //  haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "outdoor"){
          //  let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product4.name}) {
                WishListInst.wishListItems.append(product4)
            //    haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
              //  haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "homeGood"){
          //  let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product5.name}) {
                WishListInst.wishListItems.append(product5)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
              //  haptic.notificationOccurred(.error)
            }
        }
        
        
        if(ItemViewController.dt == "popular"){
            //let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product6.name}) {
                WishListInst.wishListItems.append(product1)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
        if(ItemViewController.dt == "featured"){
           // let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product7.name}) {
                WishListInst.wishListItems.append(product2)
               // haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
      
        if(ItemViewController.dt == "deals"){
           // let haptic = UINotificationFeedbackGenerator()

            if !WishListInst.wishListItems.contains(where: {$0.name == product8.name}) {
                WishListInst.wishListItems.append(product3)
              //  haptic.notificationOccurred(.success)
            } else {
                print("Product is already added to Cart")
               // haptic.notificationOccurred(.error)
            }
        }
}
}
