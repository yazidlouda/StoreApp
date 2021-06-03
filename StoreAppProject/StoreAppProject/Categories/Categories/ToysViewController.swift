//
//  ToysViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/27/21.
//

import UIKit

class ToysViewController: UIViewController ,UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toysCollectionView: UICollectionView!
    var filteredData:[Product]!
    var products : [Product]?
    var username : String?
    var phone : Int64?
    override func viewDidLoad() {
        super.viewDidLoad()
        products = DBHelper.inst.getProductsForDepartment(name: "toys")
        setupUI()
        searchBar.delegate = self
        filteredData = products
        username = "bcrits"
        // Do any additional setup after loading the view.
    }
    /*
    var toys:[Item] = [
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
    */
    func setupUI() {

       
        setupCollectionView(collection: toysCollectionView)
        
        toysCollectionView.register(UINib(nibName: "ClothingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
}
