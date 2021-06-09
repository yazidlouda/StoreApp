//
//  ProfileTableViewCell.swift
//  StoreAppProject
//
//  Created by Home on 6/8/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var refundButton: UIButton!
    @IBOutlet weak var trackButton: UIButton!
    @IBOutlet weak var orderNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
