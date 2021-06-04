//
//  UserDashboardViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit
import UserNotifications


class UserDashboardViewController: UIViewController {

    var username : String?
    var phone : Int64?
    var clothingProducts : [Product]?
    var kitchenProducts : [Product]?
    var outdoorsProducts : [Product]?
    
    @IBOutlet weak var clothingCollectionView: UICollectionView!
    @IBOutlet weak var kitchenCollectionView: UICollectionView!
    @IBOutlet weak var outdoorCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addLocalNotifaction()
        clothingProducts = DBHelper.inst.getProductsForDepartment(name: "clothing")
        kitchenProducts = DBHelper.inst.getProductsForDepartment(name: "kitchen")
        outdoorsProducts = DBHelper.inst.getProductsForDepartment(name: "outdoors")
       
        // Do any additional setup after loading the view.
    }

    //MARK: -> Class Methods
    
    func setupUI() {

        title = "Dashboard"
        setupCollectionView(collection: clothingCollectionView)
        setupCollectionView(collection: kitchenCollectionView)
        setupCollectionView(collection: outdoorCollectionView)
        clothingCollectionView.register(UINib(nibName: "ClothingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
        kitchenCollectionView.register(UINib(nibName: "KitchenCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell1")
        outdoorCollectionView.register(UINib(nibName: "OutdoorCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell2")
    }
    
    func addLocalNotifaction() {
        
        //Ask Permission
        let centre = UNUserNotificationCenter.current()
        centre.requestAuthorization(options: [.alert , .sound]) { (grant, error) in
            
            if error == nil {
                print("Error: \(error?.localizedDescription ?? "")")
            }
        }
        //Create Notifaction Content
        let content = UNMutableNotificationContent()
        content.title = "HI 🔴"
        content.body = "Come Again To See New Items.🚚🚛"
        content.sound = .default
        
        //Create Notifaction Trigger
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        //Create Request
        let uuidString = UUID().uuidString
        let reqeust  = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        centre.add(reqeust) { (error) in
            
        }
    }
}
