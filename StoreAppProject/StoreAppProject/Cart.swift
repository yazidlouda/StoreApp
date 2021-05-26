//
//  Cart.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import Foundation
class Cart {
    static let sharedInstance = Cart()
    var cartItems = [Item]()
    private init() {}
    
    func getTotal() -> Double {
        var total  = 0.00
        let arrayOfOnlyTotalsFromCartItems = cartItems.map({ $0.price })
        total = arrayOfOnlyTotalsFromCartItems.reduce(0.00, { x, y in
            x + y
        })
        return total
    }
}
