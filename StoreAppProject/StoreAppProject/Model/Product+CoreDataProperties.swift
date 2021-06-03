//
//  Product+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by admin on 6/3/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var avgRating: Double
    @NSManaged public var id: UUID?
    @NSManaged public var info: String?
    @NSManaged public var marketPrice: Double
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var image: NSObject?
    @NSManaged public var department: Department?
    @NSManaged public var reviews: NSSet?
    @NSManaged public var promotion: Promotion?

}

// MARK: Generated accessors for reviews
extension Product {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}

extension Product : Identifiable {

}
