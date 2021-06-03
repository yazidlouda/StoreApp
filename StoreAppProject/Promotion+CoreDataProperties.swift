//
//  Promotion+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by admin on 6/3/21.
//
//

import Foundation
import CoreData


extension Promotion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Promotion> {
        return NSFetchRequest<Promotion>(entityName: "Promotion")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var discount: Double
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var products: NSSet?

}

// MARK: Generated accessors for products
extension Promotion {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Product)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Product)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}

extension Promotion : Identifiable {

}
