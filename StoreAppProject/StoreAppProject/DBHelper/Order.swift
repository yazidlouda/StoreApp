//
//  Order.swift
//  StoreAppProject
//
//  Created by admin on 6/7/21.
//

import Foundation
import CoreData

extension DBHelper {
    
    static var orderNum : UUID = UUID()
    
    func checkout() {
        DBHelper.cartSet = []
        DBHelper.cartItemSubtotals = [:]
        DBHelper.cartItemQuantities = [:]
        DBHelper.cartTotal = 0.0
        
        let order = Order(context: context!)
        order.date = Date()
        order.status = .placed
        order.id = UUID()
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        if (DBHelper.currentUser != "") {
            fetchReq.predicate = NSPredicate(format: "username == %@", DBHelper.currentUser)
        } else if (DBHelper.currentPhone != 0) {
            fetchReq.predicate = NSPredicate(format: "phoneNumber == %@,", DBHelper.currentPhone)
        }
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0) {
                customer = res.first!
            }
            let cart = customer.cart! as NSSet
            order.addToProducts(cart)
            order.itemSubtotals = customer.cartItemSubtotals
            order.itemQuantities = customer.cartItemQuantities
            order.total = customer.cartTotal
            order.customer = customer
            customer.cart = DBHelper.cartSet
            customer.cartItemQuantities = DBHelper.cartItemQuantities
            customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            customer.cartTotal = 0.0
            DBHelper.orderNum = order.id!
            try context?.save()
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func clearOrders(username: String) {
        var customer = DBHelper.inst.getCustomer(withEmailID: username)
        for order in customer.orders! {
            self.context?.delete(order as! NSManagedObject)
        }
        do {
            try self.context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        let refetchedCustomer = DBHelper.inst.getCustomer(withEmailID: username)
        print(refetchedCustomer.orders)
        
    }
    
    func getAllUserOrders(username: String) -> Array<String> {
        let order : [Order]
        var orderIDs : [String] = []
        let customer = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
        order = customer.orders?.allObjects as! [Order]
        for allOrders in order {
            orderIDs.append(allOrders.id!.uuidString)
        }
        return orderIDs
    }
    
}
