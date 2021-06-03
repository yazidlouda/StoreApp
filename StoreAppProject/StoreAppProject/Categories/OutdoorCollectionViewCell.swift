//
//  OutdoorCollectionViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/25/21.
//

import UIKit

class OutdoorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    //var product : Product?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupOutdoorCell(product:Product)  {
        name.text = product.name
        image.image = product.image
       
    }
}
