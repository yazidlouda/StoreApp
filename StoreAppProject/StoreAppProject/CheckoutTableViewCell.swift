//
//  CheckoutTableViewCell.swift
//  StoreAppProject
//
//  Created by Home on 6/5/21.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    var index: Int?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
