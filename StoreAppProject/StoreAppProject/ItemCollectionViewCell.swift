//
//  ItemCollectionViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var lb: UILabel!
    @IBOutlet weak var lb1: UILabel!
    
    func configure(with item: Item){
        lb.text = item.name
        lb1.text = "$" + item.price.description
        itemImage.image = item.image
    }
   
    
}
