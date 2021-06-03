//
//  UIImageValueTransformer.swift
//  StoreAppProject
//
//  Created by admin on 5/30/21.
//

import Foundation
import UIKit

class UIImageValueTransformer : ValueTransformer {

    static let name = NSValueTransformerName(rawValue: String(describing: UIImageValueTransformer.self))
    
    override public class func transformedValueClass() -> AnyClass {
        return UIImage.self
    }
    override public class func allowsReverseTransformation() -> Bool {
        return true
    }
    override public func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }
            
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            fatalError("error transforming value")
        }
    }
        
    override public func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? NSData else { return nil }
            
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data as Data)
            return color
        } catch {
            fatalError("error transforming value")
        }
    }

        
    public static func register() {
        print("UIImageValueTransformer has been registered")
        let transformer = UIImageValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
        
    
}
