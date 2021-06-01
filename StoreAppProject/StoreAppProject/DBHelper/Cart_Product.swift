//
//  Cart_Product.swift
//  StoreAppProject
//
//  Created by admin on 5/28/21.
//

import Foundation
import CoreData

extension DBHelper {
    func addProduct(name: String, price: Double, info: String) {
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context!) as!  Product
        
        product.name = name
        product.price = price
        product.info = info
        product.id = UUID()
        
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func addToCart(productID: UUID, quantity: Int, forCustomerWithEmailID username: String) {
        var product = Product(entity: Product.entity(), insertInto: context)
        let fetchReqP = NSFetchRequest<NSManagedObject>(entityName:"Product")
        fetchReqP.predicate = NSPredicate(format: "id == %@", productID.uuidString)
        fetchReqP.fetchLimit = 1
        
        var customer = Customer(entity: Customer.entity(), insertInto: context)
        let fetchReqC = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReqC.predicate = NSPredicate(format: "username == %@", username)
        fetchReqC.fetchLimit = 1
        
        do {
            let resP = try context?.fetch(fetchReqP) as! [Product]
            let resC = try context?.fetch(fetchReqC) as! [Customer]
            if (resP.count != 0){
                product = resP.first!
            } else {
                print("product not found")
            }
            if (resC.count != 0){
                customer = resC.first!
            } else {
                print("customer not found")
            }
            if (customer.cart == nil) {
                customer.cart = [Product]()
            }
            customer.cart?.append(product)
            
            try context?.save()
        } catch (let exception) {
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
}
