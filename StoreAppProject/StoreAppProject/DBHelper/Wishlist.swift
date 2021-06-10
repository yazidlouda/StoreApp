//
//  Wishlist.swift
//  StoreAppProject
//
//  Created by admin on 6/7/21.
//

import Foundation
import CoreData

extension DBHelper {
    func addToWishlist(productID: UUID) -> Bool {
        var isSuccessful = false
        var customer = Customer()
        var product = Product()
        switch DBHelper.isLoggedIn {
        case true:
            
            let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
            
            if (DBHelper.currentUser != "") {
                fetchReqC.predicate = NSPredicate(format: "username == %@", DBHelper.currentUser)
            } else if (DBHelper.currentPhone != 0) {
                fetchReqC.predicate = NSPredicate(format: "phoneNumber == %@,", DBHelper.currentPhone)
            }
            fetchReqC.fetchLimit = 1
            
            do {
                let resC = try context?.fetch(fetchReqC) as! [Customer]
                if (resC.count != 0) {
                    customer = resC.first!
                } else {
                    print("customer not found")
                }
            } catch (let exception) {
                print(exception.localizedDescription)
            }
            
            DBHelper.wishlistSet = customer.wishlist!
            
            fallthrough
        case false:
            let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
            fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
            fetchReqP.fetchLimit = 1
            
            do {
                let resP = try context?.fetch(fetchReqP) as! [Product]
                if (resP.count != 0) {
                    product = resP.first!
                } else {
                    print("product not found")
                }
            } catch (let exception) {
                print(exception.localizedDescription)
            }
            
            if (DBHelper.wishlistSet.contains(product)) {
                print("product already in wishlist")
            } else {
                isSuccessful = true
                DBHelper.wishlistSet.insert(product)
            }
            
            
            print(DBHelper.wishlistSet)
        }
        
        if (DBHelper.isLoggedIn) {
            customer.wishlist = DBHelper.wishlistSet
            
            do {
                try context?.save()
            } catch (let exception) {
                print(exception.localizedDescription)
            }
        }
        return isSuccessful
        
        
    }
    
    func deleteFromWishlist(productID: UUID) {
        var isSuccessful = false
        var customer = Customer()
        var product = Product()
        switch DBHelper.isLoggedIn {
        case true:
            
            let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
            
            if (DBHelper.currentUser != "") {
                fetchReqC.predicate = NSPredicate(format: "username == %@", DBHelper.currentUser)
            } else if (DBHelper.currentPhone != 0) {
                fetchReqC.predicate = NSPredicate(format: "phoneNumber == %@,", DBHelper.currentPhone)
            }
            fetchReqC.fetchLimit = 1
            
            do {
                let resC = try context?.fetch(fetchReqC) as! [Customer]
                if (resC.count != 0) {
                    customer = resC.first!
                } else {
                    print("customer not found")
                }
            } catch (let exception) {
                print(exception.localizedDescription)
            }
            
            DBHelper.wishlistSet = customer.wishlist!
            
            fallthrough
        case false:
            let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
            fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
            fetchReqP.fetchLimit = 1
            
            do {
                let resP = try context?.fetch(fetchReqP) as! [Product]
                if (resP.count != 0) {
                    product = resP.first!
                } else {
                    print("product not found")
                }
            } catch (let exception) {
                print(exception.localizedDescription)
            }
            DBHelper.wishlistSet.remove(product)
            
            print(DBHelper.wishlistSet)
        }
        
        if (DBHelper.isLoggedIn) {
            customer.wishlist = DBHelper.wishlistSet
            
            do {
                try context?.save()
            } catch (let exception) {
                print(exception.localizedDescription)
            }
        }
        
        
    }
    
}
