//
//  ProfilePageViewController.swift
//  StoreAppProject
//
//  Created by Home on 6/9/21.
//
import UIKit


class ProfilePageViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    static var balance = ""
    static var delete = ""
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    var ordersIDs : Array<String> = []
    var orderPrices : Array<Double> = []
    @IBOutlet weak var tableView: UITableView!
    let userData : Customer = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
    let data = [1.0,2.4]
    @IBOutlet weak var accountBalance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = DBHelper.currentUser
        tableView.reloadData()
        phoneNumber.text = String(userData.phoneNumber)
        accountBalance.text = String("$\(userData.giftCardBalance)")
        ordersIDs = DBHelper.inst.getAllUserOrders(username: DBHelper.currentUser)
        orderPrices = DBHelper.inst.getAllUserOrdersAmount(username: DBHelper.currentUser)
        accountBalance.text = ProfilePageViewController.balance
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersIDs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell

        let order : String = ordersIDs[indexPath.row]
        let index = order.index(order.startIndex, offsetBy: 8)

        let a = String(order.prefix(upTo: index))
        
        
        cell.configure(with: a)
        cell.configurePrice(with: orderPrices[indexPath.row])
        cell.delegate = self
        

        return cell

    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            
            tableView.beginUpdates()
            
            if(ProfilePageViewController.delete == RefundSubmitViewController.order){
                
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            tableView.endUpdates()

        }
    }
   
}
extension ProfilePageViewController: ProfileTableViewCellDelegate{
    func didTapTrack(with title: String) {
        OrderStatusViewController.order = title
    }
    
    func didTapRefund(with price: Double) {
        RefundSubmitViewController.refund = price
    }
    
    
    
    func didTapRefund(with title: String) {
        //print(title)
        RefundSubmitViewController.order = title
        RefundSuccessfulViewController.order = title
        
    }
}
