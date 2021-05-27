//
//  ClothingCollectionViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/25/21.
//

import UIKit

class ClothingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    static let cellName =  String(describing: ClothingCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupClothingCell(item:Item)  {
        name.text = item.name
        image.image = item.image
        price.text = item.price.description
    }
}
