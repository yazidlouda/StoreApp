//
//  ProfileTableViewCell.swift
//  StoreAppProject
//

//  Created by Scott Benson on 6/8/21.

//

import UIKit
protocol ProfileTableViewCellDelegate: AnyObject {
    func didTapRefund(with title: String)
    func didTapRefund(with price: Double)
    func didTapTrack(with title: String)
}
class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var orderNumber: UILabel!
    private var title: String = ""
    private var price: Double = 0.00
    weak var delegate: ProfileTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with title: String){
        self.title = title
       // refundButton.setTitle(title, for: .normal)
        orderNumber.text = title
    }
    func configurePrice(with price: Double){
        self.price = price
       // refundButton.setTitle(title, for: .normal)
       // orderPrice.text = price.description
    }
    
    @IBAction func didTapRefund(_ sender: Any) {
        delegate?.didTapRefund(with: title)
        delegate?.didTapRefund(with: price)
    }
    
    @IBAction func didTapTrack(_ sender: Any) {
        delegate?.didTapTrack(with: title)
    }
    

}
