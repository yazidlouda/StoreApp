//
//  PaymentMethod.swift
//  StoreAppProject
//
//  Created by admin on 5/26/21.
//

import Foundation

enum MethodType : String {
    case BankAccount = "bank"
    case Card = "card"
}

class PaymentMethod {
    public var type : MethodType
    public var firstName : String = ""
    public var lastName : String = ""
    public var accountNum : Int64 = 0
    public var routingNum : Int64 = 0
    public var cardNum : Int64 = 0
    public var cvc : Int64 = 0
    public var expDate : DateComponents = DateComponents()
    public var zip : Int64 = 0
    
    static var methods : [PaymentMethod] = []
    
    init(type: MethodType) {
        self.type = type
    }
}


