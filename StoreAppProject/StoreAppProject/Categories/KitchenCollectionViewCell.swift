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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupKitchenCell(item:Item)  {
        name.text = item.name
        image.image = item.image
       
    }
}
