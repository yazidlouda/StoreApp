//
//  Cart_Product.swift
//  StoreAppProject
//
//  Created by admin on 6/3/21.
//

import Foundation
import CoreData
import UIKit

extension DBHelper {
    
    func addProduct(name: String, price: Double, info: String, image: UIImage, department: Department) {
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context!) as!  Product
        
        product.name = name
        product.price = price
        product.info = info
        product.id = UUID()
        product.image = image
        product.department = department
        
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func addToCart(productID: UUID, quantity: Int) -> Bool {
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
            
            DBHelper.cartSet = customer.cart!
            DBHelper.cartItemQuantities = customer.cartItemQuantities!
            DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
            DBHelper.cartTotal = customer.cartTotal
            
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
            
            if (DBHelper.cartSet.contains(product)) {
                print("product already in cart, updating quantity")
                DBHelper.cartItemQuantities[product.id!]! += Int64(quantity)
                DBHelper.cartItemSubtotals[product.id!]! += ( product.price * Double(quantity) )
            } else {
                isSuccessful = true
                DBHelper.cartSet.insert(product)
                DBHelper.cartItemQuantities[product.id!] = Int64(quantity)
                DBHelper.cartItemSubtotals[product.id!] = ( product.price * Double(quantity) )
            }
            DBHelper.cartTotal += ( product.price * Double(quantity) )
            
            print(DBHelper.cartSet)
            print(DBHelper.cartItemQuantities)
            print(DBHelper.cartItemSubtotals)
        }
        
        if (DBHelper.isLoggedIn) {
            customer.cartTotal = DBHelper.cartTotal
            customer.cart = DBHelper.cartSet
            customer.cartItemQuantities = DBHelper.cartItemQuantities
            customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            
            do {
                try context?.save()
            } catch (let exception) {
                print(exception.localizedDescription)
            }
        }
        return isSuccessful
        
    }
    
    func updateCartQuantity(productID : UUID, quantity: Int) {
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
        
            DBHelper.cartItemQuantities = customer.cartItemQuantities!
            DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
            DBHelper.cartTotal = customer.cartTotal
            
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
            
            DBHelper.cartItemQuantities[productID]! += Int64(quantity)
            DBHelper.cartItemSubtotals[productID]! += ( product.price * Double(quantity) )
            DBHelper.cartTotal += ( product.price * Double(quantity) )
            
            print(DBHelper.cartSet)
            print(DBHelper.cartItemQuantities)
            print(DBHelper.cartItemSubtotals)
        }
        
        if (DBHelper.isLoggedIn) {
            customer.cartTotal = DBHelper.cartTotal
            customer.cart = DBHelper.cartSet
            customer.cartItemQuantities = DBHelper.cartItemQuantities
            customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            
            do {
                try context?.save()
            } catch (let exception) {
                print(exception.localizedDescription)
            }
        }
        
    }
    
    
    
    func deleteFromCart(productID: UUID) {
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
            
            DBHelper.cartSet = customer.cart!
            DBHelper.cartItemQuantities = customer.cartItemQuantities!
            DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
            DBHelper.cartTotal = customer.cartTotal
            
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
            
            DBHelper.cartSet.remove(product)
            DBHelper.cartItemQuantities.removeValue(forKey: product.id!)
            DBHelper.cartItemSubtotals.removeValue(forKey: product.id!)
            var updatedTotal = 0.0
            for prod in DBHelper.cartSet {
                let quantity = DBHelper.cartItemQuantities[prod.id!]!
                updatedTotal += (Double(quantity) * prod.price)
            }
            DBHelper.cartTotal = updatedTotal
            
            print(DBHelper.cartSet)
            print(DBHelper.cartItemQuantities)
            print(DBHelper.cartItemSubtotals)
        }
        
        if (DBHelper.isLoggedIn) {
            customer.cartTotal = DBHelper.cartTotal
            customer.cart = DBHelper.cartSet
            customer.cartItemQuantities = DBHelper.cartItemQuantities
            customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            
            do {
                try context?.save()
            } catch (let exception) {
                print(exception.localizedDescription)
            }
        }
        
    }
    
    func getAllProducts() -> [Product] {
        var products = [Product]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Product")
        
        do {
            products = try context?.fetch(fetchReq) as! [Product]
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
        return products
        
    }
    
    func deleteAllProducts() {
        let fetchReq = Product.fetchRequest() as NSFetchRequest<Product>
        do {
            let result = try context?.fetch(fetchReq)
            for data in result! {
                context?.delete(data)
            }
            try context?.save()
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    
    func addDepartment(name: String) {
        let dept = NSEntityDescription.insertNewObject(forEntityName: "Department", into: context!) as!  Department
        
        dept.name = name
        
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func getDepartment(name: String) -> Department {
        var dept = Department()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Department")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Department]
            if (res.count != 0){
                dept = res.first!
            } else {
                "no department found with that name"
            }
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        return dept
    }
}
