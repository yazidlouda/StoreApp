//
//  DBHelper.swift
//  StoreAppProject
//


import Foundation
import CoreData
import UIKit

class DBHelper {
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
        
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
    }
    
    static var found = 0
    
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
