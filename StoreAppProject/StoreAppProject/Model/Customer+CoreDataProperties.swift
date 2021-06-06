//
//  Customer+CoreDataProperties.swift
//  
//
//  Created by Home on 6/4/21.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var cartTotal: Double
    @NSManaged public var firstname: String?
    @NSManaged public var giftCardBalance: Double
    @NSManaged public var lastname: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: Int64
    @NSManaged public var username: String?
    @NSManaged public var paymentMethods: NSSet?
    @NSManaged public var cart: [Product]?

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
