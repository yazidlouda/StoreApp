//
//  ProductViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/28/21.
//

import UIKit

class ProductViewController: UIViewController ,UISearchBarDelegate{

    @IBOutlet weak var numberOfItems: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    var username : String?
    var phone : Int64?
    var products : [Product]?
    @IBOutlet weak var productCollectionView: UICollectionView!
    var filteredData:[Product]!
        override func viewDidLoad() {
        super.viewDidLoad()
        products = DBHelper.inst.getProductsForDepartment(name: "clothing")
            products?.append(contentsOf: DBHelper.inst.getProductsForDepartment(name: "kitchen"))
            products?.append(contentsOf: DBHelper.inst.getProductsForDepartment(name: "toys"))
            products?.append(contentsOf: DBHelper.inst.getProductsForDepartment(name: "outdoors"))
            products?.append(contentsOf: DBHelper.inst.getProductsForDepartment(name: "home good"))
        setupUI()
        searchBar.delegate = self
        filteredData = products
        numberOfItems.text = filteredData.count.description

        username = "bcrits"

       
        if (FilterViewController.sort == "low"){
            self.filteredData?.sort(by: { $0.price < $1.price })
            print(FilterViewController.sort!)
            productCollectionView.reloadData()
        }
        if (FilterViewController.sort == "high"){
            self.filteredData?.sort(by: { $0.price > $1.price })
            print(FilterViewController.sort!)
            productCollectionView.reloadData()
        }
            productCollectionView.reloadData()
            
        // Do any additional setup after loading the view.
    }
    /*
    var product:[Item] = [
        Item(name: "iRobot 600", price: 39.99, image: UIImage(named: "h1")!, description: "The 600 series is a great way to begin cleaning your home smarter. Just schedule it to clean up daily dirt, dust, and debris with the iRobot HOME app or your voice assistant. - for effortlessly clean floors."),
        Item(name: "Yankee Candle", price: 59.99, image: UIImage(named: "h2")!, description: "A heartwarming blend of cinnamon, baking spices, and a hint of freshly poured tea."),
        Item(name: "Plant Pots", price: 149.99, image: UIImage(named: "od9")!, description: "Thick, high-quality PP materials can be used repeatedly without fading, not easy to crack even in summer."),
        Item(name: "LEGO Darth Vader Helmet", price: 99.99, image: UIImage(named: "toy3")!, description: "Escape the stresses of everyday life for a while and enjoy some quality time recreating every menacing detail of Darth Vader’s Helmet with this collectible LEGO Star Wars building kit."),
        Item(name: "D&D Dragon Figure", price: 29.99, image: UIImage(named: "toy4")!, description: "The D&D Icons of the Realms: Adult Blue Dragon Premium Figure is an excellent addition to your miniatures collection or display shelf."),
        Item(name: "Cargo Shorts", price: 79.99, image: UIImage(named: "c7")!, description: "Sits at waist, zip fly and button closure, drawstring tie at waist and belt loops."),
        Item(name: "Star Wars T-Shirt", price: 39.99, image: UIImage(named: "c8")!, description: "Find your Disney style! Amazon Essentials and Disney pair up to add some wonder to your wardrobe with fresh prints and patterns for your family featuring your favorite characters from Mickey, Marvel to Star Wars and more."),
        Item(name: "Wooden Utensils", price: 69.99, image: UIImage(named: "k6")!, description: "Our wooden kitchen utensil set includes a wooden spatula, a slotted spoon, a small wooden spoon, and a bamboo mat. Made of 100% natural teak wood."),
        Item(name: "Nifty Coffee Pod Storage", price: 79.99, image: UIImage(named: "k7")!, description: "The Nifty Coffee Pod Storage Drawer is compatible with K-Cups and will hold up to 36 of your favorite pods where space is a necessity."),
        Item(name: "Outdoor Hammock", price: 99.99, image: UIImage(named: "od3")!, description: "Unlike Other Hammocks ours are made of high quality heavy duty 210T parachute nylon. This extra soft yet super strong material gives you the most comfortable and relaxing experience ever."),

    ]*/

    
    let rating = [4.0,3.0,2.5,4.5,5.0,3.6,4.0,2.0,1.0,3.5,]

 
    func setupUI() {

       
        setupCollectionView(collection: productCollectionView)
        
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
    
   
}

