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
    func setupProductCell(product:Product)  {
        name.text = product.name
        image.image = product.image
        price.text = "$" + product.price.description
    }
}
