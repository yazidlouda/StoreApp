//
//  ProductCollectionViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/28/21.
//

import UIKit
import Cosmos
class ProductCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var rat: CosmosView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    var index: Int?
    
    static let cellName =  String(describing: ProductCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    func setupProductCell(product:Product)  {
        name.text = product.name
        image.image = (product.image as! UIImage)
        price.text = "$" + product.price.description
    }

    func setupRating(ratt: Double){
        rat.rating = ratt

    }

}

