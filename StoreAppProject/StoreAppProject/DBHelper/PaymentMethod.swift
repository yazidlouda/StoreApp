//
//  PaymentMethod.swift
//  StoreAppProject
//
//  Created by admin on 5/30/21.
//

import Foundation
import CoreData

extension DBHelper {
    func addCard(firstName : String, lastName : String, numberData : [String:Int64], expDate : DateComponents, forCustomerWithEmailID username: String) {
        let card = NSEntityDescription.insertNewObject(forEntityName: "PaymentMethod", into: context!) as!  PaymentMethod
        card.typeIndicator = "card"
        card.firstName = firstName
        card.lastName = lastName
        card.cardNum = numberData["cardNum"]!
        card.cvc = numberData["cvc"]!
        card.zip = numberData["zip"]!
        card.expDate = expDate.date
        print(expDate.date)
        print(expDate)
        card.id = UUID()
        
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0){
                customer = res.first!
                customer.addToPaymentMethods(card)
                print(customer)
                try context?.save()
            } else {
                print("customer not found")
            }
            
        } catch(let exception) {
            print(exception.localizedDescription)
        }
    }
    
    func addBankAccount(firstName : String, lastName : String, numberData : [String:Int64], forCustomerWithEmailID username: String) {
        let bankAccount = NSEntityDescription.insertNewObject(forEntityName: "PaymentMethod", into: context!) as!  PaymentMethod
        bankAccount.typeIndicator = "bank"
        bankAccount.firstName = firstName
        bankAccount.lastName = lastName
        bankAccount.accountNum = numberData["accountNum"]!
        bankAccount.routingNum = numberData["routingNum"]!
        
        bankAccount.id = UUID()
        
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0){
                customer = res.first!
                customer.addToPaymentMethods(bankAccount)
                print("customer found: ", customer)
                try context?.save()
            } else {
                print("customer not found")
            }
            
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func addCard(firstName : String, lastName : String, numberData : [String:Int64], expDate : DateComponents, forCustomerWithPhone number: Int64) {
        let card = NSEntityDescription.insertNewObject(forEntityName: "PaymentMethod", into: context!) as!  PaymentMethod
        card.typeIndicator = "card"
        card.firstName = firstName
        card.lastName = lastName
        card.cardNum = numberData["cardNum"]!
        card.cvc = numberData["cvc"]!
        card.zip = numberData["zip"]!
        //card.expDate = expDate
        
        card.id = UUID()
        
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0){
                customer = res.first!
                customer.addToPaymentMethods(card)
                try context?.save()
            } else {
                print("customer not found")
            }
            
        } catch(let exception) {
            print(exception.localizedDescription)
        }
    }
    
    func addBankAccount(firstName : String, lastName : String, numberData : [String:Int64], forCustomerWithPhone number: Int64) {
        let bankAccount = NSEntityDescription.insertNewObject(forEntityName: "PaymentMethod", into: context!) as!  PaymentMethod
        bankAccount.typeIndicator = "bank"
        bankAccount.firstName = firstName
        bankAccount.lastName = lastName
        bankAccount.accountNum = numberData["accountNum"]!
        bankAccount.routingNum = numberData["routingNum"]!
        
        bankAccount.id = UUID()
        
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "phoneNumber == %@", number)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0){
                customer = res.first!
                customer.addToPaymentMethods(bankAccount)
                try context?.save()
            } else {
                print("customer not found")
            }
            
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
    }
    
    func clearPaymentMethods(username: String) {
        let customer = DBHelper.inst.getCustomer(withEmailID: username)
        for paymentMethod in customer.paymentMethods! {
            self.context?.delete(paymentMethod as! NSManagedObject)
        }
        do {
            try self.context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        let refetchedCustomer = DBHelper.inst.getCustomer(withEmailID: username)
        print(refetchedCustomer.paymentMethods)
    }
}
