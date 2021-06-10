//
//  PaymentMethod+CoreDataClass.swift
//  StoreAppProject
//
//  Created by admin on 5/30/21.
//
//

import Foundation
import CoreData

@objc(PaymentMethod)
public class PaymentMethod: NSManagedObject {
    enum TypeError : Error {
        case noTypeIndicator
    }
    
    enum ExpDateError : Error {
        case noExpDate
    }
    
    var type: MethodType {
            get {
                return MethodType(rawValue: self.typeIndicator ?? "")!
            }
            set {
                self.typeIndicator = newValue.rawValue
            }
        }
    
    func getExpDateComponents() throws -> DateComponents {
        switch type {
        case .BankAccount:
            print("you're trying to access an expDate on a .BankAccount")
            throw ExpDateError.noExpDate
        case .Card:
            return Calendar.current.dateComponents([.month, .year], from: self.expDate!)
        }
    }
    
}
