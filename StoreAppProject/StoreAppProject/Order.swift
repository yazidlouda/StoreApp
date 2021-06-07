//
//  Order.swift
//  StoreAppProject
//
//  Created by Home on 6/5/21.
//

import Foundation
class Orders{
    static let sharedInstance = Orders()
    var orderItems = [Product]()
    private init() {}
}
