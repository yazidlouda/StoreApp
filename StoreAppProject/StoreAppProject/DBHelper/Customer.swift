//
//  Customer.swift
//  StoreAppProject
//
//  Created by admin on 6/7/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper {

    static var isLoggedIn : Bool = false
    static var currentUser : String = ""
    static var currentPhone : Int64 = 0
    


   // static var cartSet : [Product]?

    static var cartSet : Set<Product> = []
    static var wishlistSet : Set<Product> = []
    static var cartItemQuantities : [UUID : Int64] = [:]
    static var cartItemSubtotals : [UUID : Double] = [:]
    static var cartTotal = 0.0


    static var inst = DBHelper()
    
    var context : NSManagedObjectContext?
    
    init() {
        context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
    }
    
    //Adds a new customer to the database using emailID as identifier
    func addCustomer(password: String, withEmailID username: String) {
        
        let customer = NSEntityDescription.insertNewObject(forEntityName: "Customer", into: context!) as! Customer
        
        customer.username = username
        customer.password = password
        customer.cartItemQuantities = DBHelper.cartItemQuantities
        customer.cartItemSubtotals = DBHelper.cartItemSubtotals
        //var p = Product()
        //pro.append(p)
        //customer.cart = pro
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
        
    }
    
    //Adds a new customer to the database using phone number as identifier
    func addCustomer(password: String, withPhone number: Int64) {
        
        let customer = NSEntityDescription.insertNewObject(forEntityName: "Customer", into: context!) as! Customer
        
        customer.phoneNumber = number
        customer.password = password
        customer.cartItemQuantities = DBHelper.cartItemQuantities
        customer.cartItemSubtotals = DBHelper.cartItemSubtotals
        
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
    }
    
    static var found = 1
    
    //Returns the Customer object from the model with the specified username
    func getCustomer(withEmailID username: String) -> Customer {
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0){
                customer = res.first!
                print("customer info: ", customer)
                DBHelper.found = 0
            } else {
                print("data not found")
                DBHelper.found = 1
            }
        } catch (let exception) {
            print("catch block")
            print(exception.localizedDescription)
        }
        print("final customer info: ", customer)
        return customer
    }
    
    //Returns the Customer object from the model with the specified phone number
    func getCustomer(withPhone number: Int) -> Customer {
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0){
                customer = res.first!
                DBHelper.found = 0
            } else {
                print("data not found")
                DBHelper.found = 1
            }
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
        return customer
        
    }
    
    //Updates the password of an existing customer in the database using that customer's email ID
    func updatePasswordForCustomer(_ password: String, withEmailID username: String) {
        
        var customer = Customer()
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        do {
            let res = try context?.fetch(fetchReq)
            if (res?.count != 0) {
                customer = res?.first as! Customer
                customer.password = password
                try context?.save()
            }
        } catch {
            print("error with fetching data or saving context")
        }
    }
    

    //Updates the password of an existing customer in the database using that customer's phone number
    func updatePasswordForCustomer(_ password: String, withPhone number: String) {
        
        var customer = Customer()
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Customer")
        fetchReq.predicate = NSPredicate(format: "phoneNumber == %@", number)
        
        do {
            let res = try context?.fetch(fetchReq)
            if (res?.count != 0) {
                customer = res?.first as! Customer
                customer.password = password
                try context?.save()
            }
        } catch {
            print("error with fetching data or saving context")
        }
    }
    
    

}
