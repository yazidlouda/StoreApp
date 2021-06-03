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
    
    var popular:[Item] = [
        Item(name: "Black Elastic Shirt", price: 39.99, image: UIImage(named: "c1")!, description: "High quality stretchy and soft fabric made the fashion jumpsuit works with most body types."),
        Item(name: "Tie Dye Jumpsuit", price: 59.99, image: UIImage(named: "c2")!, description: "This jumpsuit features sleeveless tank top/ short sleeves top, bust pocket, scoop neckline, elastic smocked waist waistband, drawstring tie, two pockets, beam foot long pants."),
        Item(name: "Blue Polo", price: 99.99, image: UIImage(named: "c3")!, description: "From the course to casual wear, this classic performance polo keeps you cool and comfortable in quick-dry fabric that wicks away moisture."),
        Item(name: "Gray Pants", price: 29.99, image: UIImage(named: "c4")!, description: "This slim-fit chino pant features wrinkle-free fabric, a flat-front design, and button-through back welt pockets for a tailored look and all-day comfort."),
        Item(name: "Yellow Dress", price: 49.99, image: UIImage(named: "c5")!, description: "This versatile and figure-flattering dress transitions easily from day to night."),
        Item(name: "Zip-Up Jacket", price: 69.99, image: UIImage(named: "c6")!, description: "This everyday-classic sweatshirt is a go-to for an easy, casual look."),
        Item(name: "Cargo Shorts", price: 79.99, image: UIImage(named: "c7")!, description: "Sits at waist, zip fly and button closure, drawstring tie at waist and belt loops."),
        Item(name: "Star Wars T-Shirt", price: 39.99, image: UIImage(named: "c8")!, description: "Find your Disney style! Amazon Essentials and Disney pair up to add some wonder to your wardrobe with fresh prints and patterns for your family featuring your favorite characters from Mickey, Marvel to Star Wars and more."),
        Item(name: "Moreno Oxford Shoe", price: 149.99, image: UIImage(named: "c9")!, description: "Men's Moreno Canvas Oxford Shoe."),
        Item(name: "Sun Hat", price: 49.99, image: UIImage(named: "c10")!, description: "With wide brim flap cover on this cap, adding stylish&cool style, leading to the fashion top trend. Lightweight, comfort&protective sun cap hat for use in summer, autumn, and spring."),
    ]
    
   
    var deals:[Item] = [
        Item(name: "Spawn Action Figure", price: 39.99, image: UIImage(named: "toy1")!, description: "Incredibly detailed 7” scale figure based off the Mortal Kombat Franchise."),
        Item(name: "GT3 replica", price: 59.99, image: UIImage(named: "toy2")!, description: "An immersive and rewarding building experience with this highly authentic Nifeliz super car GT3 replica, Packed with realistic features and functions."),
        Item(name: "LEGO Darth Vader Helmet", price: 99.99, image: UIImage(named: "toy3")!, description: "Escape the stresses of everyday life for a while and enjoy some quality time recreating every menacing detail of Darth Vader’s Helmet with this collectible LEGO Star Wars building kit."),
        Item(name: "D&D Dragon Figure", price: 29.99, image: UIImage(named: "toy4")!, description: "The D&D Icons of the Realms: Adult Blue Dragon Premium Figure is an excellent addition to your miniatures collection or display shelf."),
        Item(name: "Buzz Lightyear Figure", price: 49.99, image: UIImage(named: "toy5")!, description: "Press chest button for wing release and wing lights; Wing tips, wing housing, and wrist light up activate flashing laser lights."),
        Item(name: "Camera Toy", price: 69.99, image: UIImage(named: "toy6")!, description: "2.4 inch IPS Screen Shockproof Mini kids Video Camera with dual lens,support selfie. Rear Lens features a Wide-Angle design, larger viewing and more realistic colors for a better picture. 4x digital zoom, 30 Megapixels and 1080p HD video recording. Support Auto-focus, Time-lapse shooting, 5 Burst shooting."),
        Item(name: "RC Offroad Car", price: 79.99, image: UIImage(named: "toy7")!, description: "Featuring a superior 750 mAh lithium battery, ultra-powerful motor, 2 high-strength metal universal joints, 4 resilient carbon fiber axels, 4 advanced shock absorber springs, and high grip herringbone tires."),
        Item(name: "Barbie Dreamhouse", price: 39.99, image: UIImage(named: "toy8")!, description: "Measuring 43 inches tall and 41 inches wide, the fully furnished Barbie DreamHouse inspires endless imagination with 10 indoor and outdoor play areas, customizable features and 75+ storytelling pieces!"),
        Item(name: "Nerf Rival Blaster", price: 149.99, image: UIImage(named: "toy9")!, description: "The Nerf Rival Phantom Corps is a group of rogue specialists who may join Team Red or Team Blue today, then challenge those teams tomorrow. Nerf Rival battles will never be the same! Experience intense head-to-head competition with the precision and power of the Nerf Rival Hera MXVII-1200 blaster."),
        Item(name: "Nazgul Statue", price: 49.99, image: UIImage(named: "toy10")!, description: "A Diamond Select Toys release! Form the Fellowship! Add the Hobbit that started it all to your 7-inch Lord of the Rings collection with this highly anticipated release! Featuring movie likeness, this approximately 4-inch figure shares the series with a 7-inch Nazgul/Ringwraith!"),
    ]
    var featured:[Item] = [
        Item(name: "Black Hawk Knives", price: 39.99, image: UIImage(named: "k1")!, description: "The Black Hawk 5 inch Steak Knife is designed for cutting steak, there are four knives to allow you and your family to enjoy a delicious meal together. The serrated edge provide the stunning cutting ability, so that you can cut through the tender steak with minimal effort."),
        Item(name: "Dish Drain Rack", price: 59.99, image: UIImage(named: "k2")!, description: "Perfect for your compact countertop! This over sink dish drainer rack saves tons of kitchen space and does not obstruct anything with the faucet or sink. When you dry the dishes and utensils, water will drip directly to the sink, keeping your countertop dry, clean, and tidy."),
        Item(name: "Veggie Storage", price: 99.99, image: UIImage(named: "k3")!, description: "Double Baskets, Provide Generous Storage Space, It Can Store Lots Of Fruits, Veggies, Or Other Items, Wire Design Make You Easily To Find And Select The Items You Needed."),
        Item(name: "SESENO Food Container", price: 29.99, image: UIImage(named: "k4")!, description: "Keep your food dry and safe with The SESENO Plastic Food Storage Containers."),
        Item(name: "Ember Smart Mug", price: 49.99, image: UIImage(named: "k5")!, description: "Ember smart mug allows you to control with your smartphone. Pair with the Ember app to set your temperature, customize presets, receive notifications and more."),
        Item(name: "Wooden Utensils", price: 69.99, image: UIImage(named: "k6")!, description: "Our wooden kitchen utensil set includes a wooden spatula, a slotted spoon, a small wooden spoon, and a bamboo mat. Made of 100% natural teak wood."),
        Item(name: "Nifty Coffee Pod Storage", price: 79.99, image: UIImage(named: "k7")!, description: "The Nifty Coffee Pod Storage Drawer is compatible with K-Cups and will hold up to 36 of your favorite pods where space is a necessity."),
        Item(name: "Lazy Susan", price: 39.99, image: UIImage(named: "k8")!, description: "Built-in turntables keep all your spices at your fingertips with a simple spin. Makes everything visible and provides storage for taller items."),
        Item(name: "Copper Mixer", price: 149.99, image: UIImage(named: "k9")!, description: "Featured with 800W Pure Copper High Performance Motor and aluminum housing, the mixer can definitely better handle heavier mixes like pastry and pizza dough than plastic mixers, while whipping egg whites and mashed potatoes, mixing cake batters and making frosting is also a breeze with this powerful electric mixer."),
        Item(name: "HyperGrind Coffee Grinder", price: 49.99, image: UIImage(named: "k10")!, description: "Unlike many others on the market, the Mueller HyperGrind gives you perfect consistency & precision control over the coarseness of your Pour Over, Drip, Chemex, Cold Brew, French Press, Percolator,Turkish, Espresso, Herb, or Spices grind EVERY TIME!"),
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
