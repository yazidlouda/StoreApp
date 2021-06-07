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
    
    func addToCart(productID: UUID, quantity: Int, forCustomerWithEmailID username: String) -> Bool {
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
                DBHelper.cartSet = customer.cart!
               // DBHelper.cartItemQuantities = customer.cartItemQuantities!
                //DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
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
                customer.cartTotal += (product.price * Double(quantity))
                customer.cart = DBHelper.cartSet
                customer.cartItemQuantities = DBHelper.cartItemQuantities
                customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            } else {
                print("customer not found")
            }
            print(customer.cartItemQuantities, " item quantities")
            print(customer.cart, " cart info")
            try context?.save()
        } catch (let exception) {
            print("catch block")
            print(exception.localizedDescription)
        }
        return isSuccessful
        
    }
    
    func addToCart(productID: UUID, quantity: Int, forCustomerWithPhone number: Int64) -> Bool {
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
                DBHelper.cartSet = customer.cart!
                DBHelper.cartItemQuantities = customer.cartItemQuantities!
                DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
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
                customer.cartTotal += (product.price * Double(quantity))
                customer.cart = DBHelper.cartSet
                customer.cartItemQuantities = DBHelper.cartItemQuantities
                customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            } else {
                print("customer not found")
            }
            print(customer.cartItemQuantities, " item quantities")
            print(customer.cart, " cart info")
            try context?.save()
        } catch (let exception) {
            print("catch block")
            print(exception.localizedDescription)
        }
        return isSuccessful
        
    }
    
    func updateCartQuantity(productID : UUID, quantity: Int, forCustomerWithEmailID username: String) {
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "username == %@", username)
        fetchReqC.fetchLimit = 1
        
        do {
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            let resP = try context?.fetch(fetchReqP) as! [Product]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            
            if (resC.count != 0) {
                customer = resC.first!
                DBHelper.cartItemQuantities = customer.cartItemQuantities!
                DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
                DBHelper.cartItemQuantities[productID] = Int64(quantity)
                DBHelper.cartItemSubtotals[productID] = Double(quantity) * product.price
                var updatedTotal = 0.0
                for prod in customer.cart! {
                    let quantity = DBHelper.cartItemQuantities[prod.id!]!
                    updatedTotal += (Double(quantity) * prod.price)
                }
                customer.cartTotal = updatedTotal
                customer.cartItemQuantities = DBHelper.cartItemQuantities
                customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            }
            try context?.save()
        } catch (let exception){
            print(exception.localizedDescription)
        }
        
    }
    
    func updateCartQuantity(productID : UUID, quantity: Int, forCustomerWithPhone number: Int64) {
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReqC.fetchLimit = 1
        
        do {
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            let resP = try context?.fetch(fetchReqP) as! [Product]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            if (resC.count != 0) {
                customer = resC.first!
                DBHelper.cartItemQuantities = customer.cartItemQuantities!
                DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
                DBHelper.cartItemQuantities[productID] = Int64(quantity)
                DBHelper.cartItemSubtotals[productID] = Double(quantity) * product.price
                var updatedTotal = 0.0
                for prod in customer.cart! {
                    let quantity = DBHelper.cartItemQuantities[prod.id!]!
                    updatedTotal += (Double(quantity) * prod.price)
                }
                customer.cartTotal = updatedTotal
                customer.cartItemQuantities = DBHelper.cartItemQuantities
                customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            }
            try context?.save()
        } catch (let exception){
            print(exception.localizedDescription)
        }
        
    }
    
    func deleteFromCart(productID: UUID, forCustomerWithEmailID username: String) {
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "username == %@", username)
        fetchReqC.fetchLimit = 1
        
        do {
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            let resP = try context?.fetch(fetchReqP) as! [Product]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            if (resC.count != 0) {
                customer = resC.first!
                DBHelper.cartSet = customer.cart!
                DBHelper.cartSet.remove(product)
                DBHelper.cartItemQuantities = customer.cartItemQuantities!
                DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
                DBHelper.cartItemQuantities.removeValue(forKey: productID)
                DBHelper.cartItemSubtotals.removeValue(forKey: productID)
                var updatedTotal = 0.0
                for prod in customer.cart! {
                    let quantity = DBHelper.cartItemQuantities[prod.id!]!
                    updatedTotal += (Double(quantity) * prod.price)
                }
                customer.cart = DBHelper.cartSet
                customer.cartTotal = updatedTotal
                customer.cartItemQuantities = DBHelper.cartItemQuantities
                customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            }
            try context?.save()
        } catch (let exception){
            print(exception.localizedDescription)
        }
        
    }
    
    func deleteFromCart(productID: UUID, forCustomerWithPhone number: Int64) {
        var product = Product()
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer()
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReqC.fetchLimit = 1
        
        do {
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            let resP = try context?.fetch(fetchReqP) as! [Product]
            if (resP.count != 0){
                product = resP.first!
                print("product found: ", product)
            } else {
                print("product not found")
            }
            if (resC.count != 0) {
                customer = resC.first!
                DBHelper.cartSet = customer.cart!
                DBHelper.cartSet.remove(product)
                DBHelper.cartItemQuantities = customer.cartItemQuantities!
                DBHelper.cartItemSubtotals = customer.cartItemSubtotals!
                DBHelper.cartItemQuantities.removeValue(forKey: productID)
                DBHelper.cartItemSubtotals.removeValue(forKey: productID)
                var updatedTotal = 0.0
                for prod in customer.cart! {
                    let quantity = DBHelper.cartItemQuantities[prod.id!]!
                    updatedTotal += (Double(quantity) * prod.price)
                }
                customer.cart = DBHelper.cartSet
                customer.cartTotal = updatedTotal
                customer.cartItemQuantities = DBHelper.cartItemQuantities
                customer.cartItemSubtotals = DBHelper.cartItemSubtotals
            }
            try context?.save()
        } catch (let exception){
            print(exception.localizedDescription)
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
