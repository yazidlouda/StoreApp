//
//  ProfilePageViewController.swift
//  StoreAppProject
//
//  Created by Home on 6/9/21.
//
import UIKit


class ProfilePageViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    static var selectedOrderNumber : String = ""
    static var refundAmount : Double = 0.00
    static var accountBalanceAmount : Double = 0.00
    static var fullOrderId : Any?
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    var ordersIDs : Array<String> = []
    
    @IBOutlet weak var tableView: UITableView!
    let userData : Customer = DBHelper.inst.getCustomer(withEmailID: DBHelper.currentUser)
    
    let refundSubmitVC = RefundSubmitViewController()
    
    @IBOutlet weak var accountBalance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = DBHelper.currentUser
        tableView.reloadData()
        phoneNumber.text = String(userData.phoneNumber)
        ProfilePageViewController.accountBalanceAmount = userData.giftCardBalance
        accountBalance.text = String(format: "$%.2f", ProfilePageViewController.accountBalanceAmount)
        ordersIDs = DBHelper.inst.getAllUserOrders(username: DBHelper.currentUser)
        accountBalance.text = String(format: "$%.2f", ProfilePageViewController.accountBalanceAmount)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersIDs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell
        let orderId = ordersIDs
        let order : String = ordersIDs[indexPath.row]
        let index = order.index(order.startIndex, offsetBy: 8)
        
        cell.textLabel!.text = String(order.prefix(upTo: index))
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let tag = tableView.tag
        let cellSelected = indexPath.row
        let selectedOrder = ordersIDs[indexPath.row]
        let dbReturnedOrder = DBHelper.inst.getSingleOrder(orderNumber: selectedOrder)
        ProfilePageViewController.fullOrderId = dbReturnedOrder.value(forKey:"id")
        ProfilePageViewController.refundAmount = dbReturnedOrder.value(forKey: "total") as! Double
        
        if tag == 1 {
            let cell = tableView.cellForRow(at: indexPath)! as? ProfileTableViewCell
            let orderNumberFromCell = (cell?.textLabel!.text!)
            ProfilePageViewController.selectedOrderNumber = orderNumberFromCell!
            
            let refundView = mainBoard.instantiateViewController(withIdentifier: "refundView") as! RefundSubmitViewController
            self.present(refundView, animated: true, completion: nil)
        } else {
            let cell = tableView.cellForRow(at: indexPath)! as? ProfileTableViewCell
            let orderNumberFromCell = (cell?.textLabel!.text!)
            ProfilePageViewController.selectedOrderNumber = orderNumberFromCell!
            
            let OrderStatusView = mainBoard.instantiateViewController(withIdentifier: "orderStatus") as! OrderStatusViewController
            self.present(OrderStatusView, animated: true, completion: nil)
        }
        
       
        
    }
}
