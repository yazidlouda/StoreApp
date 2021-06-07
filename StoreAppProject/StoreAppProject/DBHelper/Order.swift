//
//  Order.swift
//  StoreAppProject
//
//  Created by admin on 6/7/21.
//

import Foundation
import CoreData

extension DBHelper {
    func checkout(paymentMethodID: UUID, forCustomerWithEmailID username: String) {
        DBHelper.cartSet = []
        DBHelper.cartItemSubtotals = [:]
        DBHelper.cartItemQuantities = [:]
        
        let order = Order(context: context!)
        order.date = Date()
        order.status = .placed
        order.id = UUID()
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0) {
                customer = res.first!
            }
            let paymentMethods = customer.paymentMethods as! Set<PaymentMethod>
            for method in paymentMethods {
                if (method.id == paymentMethodID) {
                    order.paymentMethod = method
                }
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
            try context?.save()
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func checkout(paymentMethodID: UUID, forCustomerWithPhone number: Int64) {
        DBHelper.cartSet = []
        DBHelper.cartItemSubtotals = [:]
        DBHelper.cartItemQuantities = [:]
        
        let order = Order(context: context!)
        order.date = Date()
        order.status = .placed
        order.id = UUID()
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0) {
                customer = res.first!
            }
            let paymentMethods = customer.paymentMethods as! Set<PaymentMethod>
            for method in paymentMethods {
                if (method.id == paymentMethodID) {
                    order.paymentMethod = method
                }
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
    
}
