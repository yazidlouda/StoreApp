//
//  Review+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by admin on 6/3/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var comment: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var id: Int16
    @NSManaged public var rating: Int16
    @NSManaged public var product: Product?

}

extension Review : Identifiable {

}
