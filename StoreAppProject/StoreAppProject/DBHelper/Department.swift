//
//  Department.swift
//  StoreAppProject
//
//  Created by admin on 6/3/21.
//

import Foundation
import CoreData

extension DBHelper {
    func getProductsForDepartment(name: String) -> [Product] {
        var dept = Department()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Department")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        fetchReq.fetchLimit = 1
        
        var products = [Product]()
        
        do {
            let res = try context?.fetch(fetchReq) as! [Department]
            if (res.count != 0){
                dept = res.first!
                for product in dept.products! {
                    products.append(product as! Product)
                }
            } else {
                print("data not found")
            }
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
        return products
    }
}
