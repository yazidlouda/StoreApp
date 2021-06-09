//
//  CartTableViewCell.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemImage1: UIImageView!
    @IBOutlet weak var itemName1: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    var index: Int?
    
    var cartInstance = Cart.sharedInstance
    var WishListInst = WishList.sharedInstance
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
