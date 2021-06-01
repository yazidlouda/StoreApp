//
//  Customer+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/1/21.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var cart: [Product]?
    @NSManaged public var cartTotal: Double
    @NSManaged public var firstname: String?
    @NSManaged public var giftCardBalance: Double
    @NSManaged public var lastname: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: Int64
    @NSManaged public var username: String?

}

extension Customer : Identifiable {

}
