//
//  Customer+CoreDataProperties.swift
//  
//

//  Created by admin on 6/7/21.

//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var cartItemQuantities: [UUID:Int64]?
    @NSManaged public var cartTotal: Double
    @NSManaged public var firstname: String?
    @NSManaged public var giftCardBalance: Double
    @NSManaged public var lastname: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: Int64
    @NSManaged public var username: String?

   
    //@NSManaged public var cart: [Product]?

    @NSManaged public var cartItemSubtotals: [UUID:Double]?
    @NSManaged public var searches: NSObject?
    @NSManaged public var cart: Set<Product>?
    @NSManaged public var paymentMethods: NSSet?

    @NSManaged public var wishlist: Set<Product>?

}

// MARK: Generated accessors for cart
extension Customer {

    @objc(addCartObject:)
    @NSManaged public func addToCart(_ value: Product)

    @objc(removeCartObject:)
    @NSManaged public func removeFromCart(_ value: Product)

    @objc(addCart:)
    @NSManaged public func addToCart(_ values: NSSet)

    @objc(removeCart:)
    @NSManaged public func removeFromCart(_ values: NSSet)



}

// MARK: Generated accessors for paymentMethods
extension Customer {

    @objc(addPaymentMethodsObject:)
    @NSManaged public func addToPaymentMethods(_ value: PaymentMethod)

    @objc(removePaymentMethodsObject:)
    @NSManaged public func removeFromPaymentMethods(_ value: PaymentMethod)

    @objc(addPaymentMethods:)
    @NSManaged public func addToPaymentMethods(_ values: NSSet)

    @objc(removePaymentMethods:)
    @NSManaged public func removeFromPaymentMethods(_ values: NSSet)

}

// MARK: Generated accessors for wishlist
extension Customer {

    @objc(addWishlistObject:)
    @NSManaged public func addToWishlist(_ value: Product)

    @objc(removeWishlistObject:)
    @NSManaged public func removeFromWishlist(_ value: Product)

    @objc(addWishlist:)
    @NSManaged public func addToWishlist(_ values: NSSet)

    @objc(removeWishlist:)
    @NSManaged public func removeFromWishlist(_ values: NSSet)

}
