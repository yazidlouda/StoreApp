//
//  Wishlist.swift
//  StoreAppProject
//
//  Created by admin on 6/7/21.
//

import Foundation
import CoreData

extension DBHelper {
    func addToWishlist(productID: UUID, forCustomerWithEmailID username: String) -> Bool {
        var isSuccessful = false
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "username == %@", username)
        fetchReqC.fetchLimit = 1
        
        do {
            let resP = try context?.fetch(fetchReqP) as! [Product]
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            if (resC.count != 0){
                customer = resC.first!
                DBHelper.wishlistSet = customer.wishlist!
                if (DBHelper.wishlistSet.contains(product)) {
                    print("product already in wishlist")
                } else {
                    isSuccessful = true
                    DBHelper.wishlistSet.insert(product)
                }
                customer.wishlist = DBHelper.wishlistSet
            } else {
                print("customer not found")
            }
            try context?.save()
        } catch (let exception) {
            print("catch block")
            print(exception.localizedDescription)
        }
        return isSuccessful
        
    }
    
    func addToWishlist(productID: UUID, forCustomerWithPhone number: Int64) -> Bool {
        var isSuccessful = false
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReqC.fetchLimit = 1
        
        do {
            let resP = try context?.fetch(fetchReqP) as! [Product]
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            if (resC.count != 0){
                customer = resC.first!
                DBHelper.wishlistSet = customer.wishlist!
                if (DBHelper.wishlistSet.contains(product)) {
                    print("product already in wishlist")
                } else {
                    isSuccessful = true
                    DBHelper.wishlistSet.insert(product)
                }
                customer.wishlist = DBHelper.wishlistSet
            } else {
                print("customer not found")
            }
            try context?.save()
        } catch (let exception) {
            print("catch block")
            print(exception.localizedDescription)
        }
        
        return isSuccessful
        
    }
    
    func deleteFromWishlist(productID: UUID, forCustomerWithEmailID username: String) {
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "username == %@", username)
        fetchReqC.fetchLimit = 1
        
        do {
            let resP = try context?.fetch(fetchReqP) as! [Product]
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            if (resC.count != 0){
                customer = resC.first!
                DBHelper.wishlistSet = customer.wishlist!
                if (DBHelper.wishlistSet.contains(product)) {
                    print("product already in wishlist")
                } else {
                    DBHelper.wishlistSet.remove(product)
                }
                customer.wishlist = DBHelper.wishlistSet
            } else {
                print("customer not found")
            }
            try context?.save()
        } catch (let exception) {
            print("catch block")
            print(exception.localizedDescription)
        }
        
    }
    
    func deleteFromWishlist(productID: UUID, forCustomerWithPhone number: Int64) {
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReqC.fetchLimit = 1
        
        do {
            let resP = try context?.fetch(fetchReqP) as! [Product]
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            if (resC.count != 0){
                customer = resC.first!
                DBHelper.wishlistSet = customer.wishlist!
                if (DBHelper.wishlistSet.contains(product)) {
                    print("product already in wishlist")
                } else {
                    DBHelper.wishlistSet.remove(product)
                }
                customer.wishlist = DBHelper.wishlistSet
            } else {
                print("customer not found")
            }
            try context?.save()
        } catch (let exception) {
            print("catch block")
            print(exception.localizedDescription)
        }
        
    }
}
