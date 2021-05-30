//
//  Product+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by admin on 5/28/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var avgRating: Double
    @NSManaged public var info: String?
    @NSManaged public var id: UUID?
    @NSManaged public var marketPrice: Double
    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension Product : Identifiable {

}
