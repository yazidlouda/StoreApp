//
//  WishList.swift
//  StoreAppProject
//
//  Created by Home on 5/25/21.
//

import Foundation
class WishList {
    static let sharedInstance = WishList()
    var wishListItems = [Product]()
    private init() {}
    
//    func getTotal() -> Double {
//        var total  = 0.00
//        let arrayOfOnlyTotalsFromCartItems = wishListItems.map({ $0.price })
//        total = arrayOfOnlyTotalsFromCartItems.reduce(0.00, { x, y in
//            x + y
//        })
//        return total
//    }
}
