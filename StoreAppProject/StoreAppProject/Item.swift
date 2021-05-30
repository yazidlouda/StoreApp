//
//  Item.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import Foundation
import UIKit

struct Item {
    let name: String
    let price: Double
    let image: UIImage
    let description: String
}

let inventory: [Item] = [
    Item(name: "Elliot", price: 39.99, image: UIImage(named: "1")!, description: "The Elliot is a modern. "),
    Item(name: "Bellona", price: 59.99, image: UIImage(named: "1")!, description: "The Bellona is a stylish ."),
    Item(name: "Clubmaster", price: 99.99, image: UIImage(named: "1")!, description: " Clubmaster is the iconic."),
    Item(name: "Amelia", price: 29.99, image: UIImage(named: "1")!, description: "The Amelia E. Hepburn is a modern cat-eye "),
    Item(name: "Ottoto", price: 49.99, image: UIImage(named: "1")!, description: "The Ottoto  is a full-rimmed."),
    Item(name: "Andria", price: 69.99, image: UIImage(named: "1")!, description: "The Andria is a well-rounded frame ."),
    Item(name: "Revel", price: 79.99, image: UIImage(named: "1")!, description: "The Revel  is a wrap-around ."),
    Item(name: "Vogue", price: 39.99, image: UIImage(named: "1")!, description: "The Vogue VO5051S is a modern ."),
    Item(name: "Muse Ivor", price: 149.99, image: UIImage(named: "1")!, description: "The Muse Ivor is a effortlessly cool ."),
    Item(name: "Coach", price: 49.99, image: UIImage(named: "1")!, description: "The Coach HC8179 is an oversized square ."),
]

