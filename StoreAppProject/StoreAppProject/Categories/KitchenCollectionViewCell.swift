//
//  KitchenCollectionViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/25/21.
//

import UIKit

class KitchenCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    //var product : Product?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupKitchenCell(product : Product)  {
        name.text = product.name
        image.image = product.image!
       
    }
    
}
