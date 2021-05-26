//
//  UserDashboardViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit
import UserNotifications


class UserDashboardViewController: UIViewController {
    @IBOutlet weak var clothingCollectionView: UICollectionView!
    
    @IBOutlet weak var kitchenCollectionView: UICollectionView!
    @IBOutlet weak var outdoorCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addLocalNotifaction()
        // Do any additional setup after loading the view.
    }
    
    var clothing:[Item] = [
        Item(name: "Elliot", price: 39.99, image: UIImage(named: "1")!, description: "The Elliot is a modern. "),
        Item(name: "Bellona", price: 59.99, image: UIImage(named: "1")!, description: "The Bellona is a stylish ."),
        Item(name: "Clubmaster", price: 99.99, image: UIImage(named: "1")!, description: " Clubmaster is the iconic."),
        Item(name: "Amelia", price: 29.99, image: UIImage(named: "1")!, description: "The Amelia E. Hepburn is a modern cat-eye "),
        Item(name: "Ottoto", price: 49.99, image: UIImage(named: "1")!, description: "The Ottoto  is a full-rimmed."),
        Item(name: "Andria", price: 69.99, image: UIImage(named: "1")!, description: "The Andria is a well-rounded frame ."),
        Item(name: "Revel", price: 79.99, image: UIImage(named: "1")!, description: "The Revel  is a wrap-around ."),
        Item(name: "Vogue", price: 39.99, image: UIImage(named: "1")!, description: "The Vogue VO5051S is a modern ."),
        Item(name: "Muse Ivor", price: 149.99, image: UIImage(named: "1")!, description: "The Muse Ivor is a effortlessly cool ."),
        Item(name: "Coach", price: 49.99, image: UIImage(named: "1")!, description: "The Coach HC8179 is an oversized square ."),
    ]
    
   
    var kitchen:[Item] = [
        Item(name: "Elliot", price: 39.99, image: UIImage(named: "1")!, description: "The Elliot is a modern. "),
        Item(name: "Bellona", price: 59.99, image: UIImage(named: "1")!, description: "The Bellona is a stylish ."),
        Item(name: "Clubmaster", price: 99.99, image: UIImage(named: "1")!, description: " Clubmaster is the iconic."),
        Item(name: "Amelia", price: 29.99, image: UIImage(named: "1")!, description: "The Amelia E. Hepburn is a modern cat-eye "),
        Item(name: "Ottoto", price: 49.99, image: UIImage(named: "1")!, description: "The Ottoto  is a full-rimmed."),
        Item(name: "Andria", price: 69.99, image: UIImage(named: "1")!, description: "The Andria is a well-rounded frame ."),
        Item(name: "Revel", price: 79.99, image: UIImage(named: "1")!, description: "The Revel  is a wrap-around ."),
        Item(name: "Vogue", price: 39.99, image: UIImage(named: "1")!, description: "The Vogue VO5051S is a modern ."),
        Item(name: "Muse Ivor", price: 149.99, image: UIImage(named: "1")!, description: "The Muse Ivor is a effortlessly cool ."),
        Item(name: "Coach", price: 49.99, image: UIImage(named: "1")!, description: "The Coach HC8179 is an oversized square ."),
    ]
    var outdoor:[Item] = [
        Item(name: "Elliot", price: 39.99, image: UIImage(named: "1")!, description: "The Elliot is a modern. "),
        Item(name: "Bellona", price: 59.99, image: UIImage(named: "1")!, description: "The Bellona is a stylish ."),
        Item(name: "Clubmaster", price: 99.99, image: UIImage(named: "1")!, description: " Clubmaster is the iconic."),
        Item(name: "Amelia", price: 29.99, image: UIImage(named: "1")!, description: "The Amelia E. Hepburn is a modern cat-eye "),
        Item(name: "Ottoto", price: 49.99, image: UIImage(named: "1")!, description: "The Ottoto  is a full-rimmed."),
        Item(name: "Andria", price: 69.99, image: UIImage(named: "1")!, description: "The Andria is a well-rounded frame ."),
        Item(name: "Revel", price: 79.99, image: UIImage(named: "1")!, description: "The Revel  is a wrap-around ."),
        Item(name: "Vogue", price: 39.99, image: UIImage(named: "1")!, description: "The Vogue VO5051S is a modern ."),
        Item(name: "Muse Ivor", price: 149.99, image: UIImage(named: "1")!, description: "The Muse Ivor is a effortlessly cool ."),
        Item(name: "Coach", price: 49.99, image: UIImage(named: "1")!, description: "The Coach HC8179 is an oversized square ."),
    ]
    
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
