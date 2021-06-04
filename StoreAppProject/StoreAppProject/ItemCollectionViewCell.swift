//
//  ItemCollectionViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    var product : Product?
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var lb: UILabel!
    @IBOutlet weak var lb1: UILabel!
    
    func configure(product: Product){
        lb.text = product.name
        lb1.text = "$" + String(product.price)
        itemImage.image = product.image
    }
   
    
}
