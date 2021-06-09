//
//  ProfileTableViewCell.swift
//  StoreAppProject
//

//  Created by Scott Benson on 6/8/21.

//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var orderNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func trackSelected(_ sender: UIButton) {
    }
    
    @IBAction func refundSelected(_ sender: UIButton) {
        
    }
    

}
