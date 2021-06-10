//
//  OutdoorViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/27/21.
//

import UIKit

class OutdoorViewController: UIViewController ,UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var outdoorCollectionView: UICollectionView!
    var username: String?
    var phone: Int64?
    var filteredData:[Product]!
    var products: [Product]?
    override func viewDidLoad() {
        super.viewDidLoad()
        products = DBHelper.inst.getProductsForDepartment(name: "outdoors")
        setupUI()
        searchBar.delegate = self
        filteredData = products
        username = "bcrits"
        // Do any additional setup after loading the view.
    }
    /*
    var outdoor:[Item] = [
        Item(name: "Outdoor Rug", price: 39.99, image: UIImage(named: "od1")!, description: "Timeless design, this plastic patio rug is elegant as it is functional, use on your patio with outdoor furniture and accessories to show off your personal style."),
        Item(name: "G40 String Lights", price: 59.99, image: UIImage(named: "od2")!, description: "The G40 string lights are dimmable(Remote is NOT included.) and UL listed,2 spare bulbs for replacement.All the remaining bulbs will continue lighting up and brightening up our life even if some bulbs broken or removed."),
        Item(name: "Outdoor Hammock", price: 99.99, image: UIImage(named: "od3")!, description: "Unlike Other Hammocks ours are made of high quality heavy duty 210T parachute nylon. This extra soft yet super strong material gives you the most comfortable and relaxing experience ever."),
        Item(name: "Curtain Panel", price: 29.99, image: UIImage(named: "od4")!, description: "Sheer Curtain Panels in Each Package: Your package will include 2 indoor/outdoor white sheer curtains. Each panel measures 52 inch wide by 84 inch long for a total width of 104 inches and features 8 rustproof metal grommets with 1.6-inch inner diameter. Fit well with standard or decorative curtain rods, super easy to hang."),
        Item(name: "Solar Lights", price: 49.99, image: UIImage(named: "od5")!, description: "Solar Panel collects sunlight to charge the batteries(included) during the day. Automatically turns on at dusk for up to 6 hours of nighttime illumination."),
        Item(name: "Storage Deck Box", price: 69.99, image: UIImage(named: "od6")!, description: "Keter Solana 70 Gallon Storage Bench Deck Box for Patio Furniture, Front Porch Deco."),
        Item(name: "Revel", price: 79.99, image: UIImage(named: "od7")!, description: "Designed with 2 chamber benefits Batch composting, which is the most efficient way to produce high-quality compost; Let one side cook while you add fresh materials to the other, continuously swapping sides creates an uninterrupted flow of rich, healthy compost."),
        Item(name: "polyTEAK Umbrella", price: 39.99, image: UIImage(named: "od8")!, description: "100% POLYESTER FABRIC -- PolyTEAK patio umbrella is made of 100% polyester, waterproof and UV resistant, long lasting, easy to clean."),
        Item(name: "Plant Pots", price: 149.99, image: UIImage(named: "od9")!, description: "Thick, high-quality PP materials can be used repeatedly without fading, not easy to crack even in summer."),
        Item(name: "Oversized Chair", price: 49.99, image: UIImage(named: "od10")!, description: "The weatherproof chair has 22 inch oversized seat width, comfortably contoured seating with a weight capacity of 350 lbs, ergonomic backrest and wide armrests, which offer the comfort expected of Adirondack chairs. And the oversized design offers the freedom for any sitting and lying position.")
    ]*/
 
    func setupUI() {

       
        setupCollectionView(collection: outdoorCollectionView)
        
        outdoorCollectionView.register(UINib(nibName: "ClothingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
}
