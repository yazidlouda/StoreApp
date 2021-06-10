//
//  Order+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by admin on 6/7/21.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var itemQuantities: [UUID:Int64]?
    @NSManaged public var itemSubtotals: [UUID:Double]?
    @NSManaged public var total: Double
    @NSManaged public var paymentMethod: PaymentMethod?
    @NSManaged public var products: NSSet?
    @NSManaged public var customer: Customer?

}

// MARK: Generated accessors for products
extension Order {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Product)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Product)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}

extension Order : Identifiable {

}
