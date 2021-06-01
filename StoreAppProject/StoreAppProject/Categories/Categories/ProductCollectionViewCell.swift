//
//  ProductCollectionViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/28/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    static let cellName =  String(describing: ProductCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupProductCell(item:Item)  {
        name.text = item.name
        image.image = item.image
        price.text = "$" + item.price.description
    }
}
