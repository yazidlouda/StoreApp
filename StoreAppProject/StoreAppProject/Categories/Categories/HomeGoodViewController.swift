//
//  HomeGoodViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/27/21.
//

import UIKit

class HomeGoodViewController: UIViewController ,UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var homeGoodCollectionView: UICollectionView!
    var filteredData:[Product]!
    var products : [Product]?
    var username : String?
    var phone : Int64?
    override func viewDidLoad() {
        super.viewDidLoad()
        products = DBHelper.inst.getProductsForDepartment(name: "home goods")
        setupUI()
        searchBar.delegate = self
        filteredData = products
        username = "bcrits"
        // Do any additional setup after loading the view.
    }
    
    /*var homeGood:[Item] = [
        Item(name: "iRobot 600", price: 39.99, image: UIImage(named: "h1")!, description: "The 600 series is a great way to begin cleaning your home smarter. Just schedule it to clean up daily dirt, dust, and debris with the iRobot HOME app or your voice assistant. - for effortlessly clean floors."),
        Item(name: "Yankee Candle", price: 59.99, image: UIImage(named: "h2")!, description: "A heartwarming blend of cinnamon, baking spices, and a hint of freshly poured tea."),
        Item(name: "Air Purifier", price: 99.99, image: UIImage(named: "h3")!, description: "New generation HEPA air purifiers for smokers, allergies, mold, pet owners, parents with newborns."),
        Item(name: "Broom and Dust Pan", price: 29.99, image: UIImage(named: "h4")!, description: "Broom and dust pan Snaps together for easy stand-up storage, save your space and easy for moving."),
        Item(name: "AccuCheck Scale", price: 49.99, image: UIImage(named: "h5")!, description: "The AccuCheck verifies its initial reading after you step off. Never question the process: an orange light means you’ve been weighed and green means it’s verified."),
        Item(name: "Hanging Sign", price: 69.99, image: UIImage(named: "h6")!, description: "Today is A Good Day to Have A Good Day - Sometimes, all we need is the right attitude. We have 24 hours in a day, and we can do so much with it! Let’s start with today."),
        Item(name: "Towel Set", price: 79.99, image: UIImage(named: "h7")!, description: "Perfect Towel Set - Set includes 4 piece bath towel 30 x 54. Enjoy this bath towel in a whopping over-size."),
        Item(name: "MyPillow Pillow", price: 39.99, image: UIImage(named: "h8")!, description: "Made with patented interlocking fill, gives you the exact support you need as an individual."),
        Item(name: "20V Tool Set", price: 149.99, image: UIImage(named: "h9")!, description: "Includes 20V Lithium drill for a variety of home projects, hanging pictures or wall decor, assembling furniture, updating fixtures, building birdhouses."),
        Item(name: "Comforter Set", price: 49.99, image: UIImage(named: "h10")!, description: "Super Soft Microfiber All Season Blanket Comforter , Lightweight but warm material, perfect summer comforter or extra blanket during the winter. Specially processed fabrics are more comfortable and breathable, and friendly to human skin.")
    ]*/
 
    func setupUI() {

       
        setupCollectionView(collection: homeGoodCollectionView)
        
        homeGoodCollectionView.register(UINib(nibName: "ClothingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
}
