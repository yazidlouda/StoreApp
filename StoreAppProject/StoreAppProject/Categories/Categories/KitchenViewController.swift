//
//  KitchenViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/27/21.
//

import UIKit

class KitchenViewController: UIViewController ,UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kitchenCollectionView: UICollectionView!
    var filteredData:[Product]!
    var username : String?
    var phone : Int64?
    var products : [Product]?
    override func viewDidLoad() {
        super.viewDidLoad()
        products = DBHelper.inst.getProductsForDepartment(name: "kitchen")
        setupUI()
        searchBar.delegate = self
        filteredData = products
        username = "bcrits"
        // Do any additional setup after loading the view.
    }
    /*
    var kitchen:[Item] = [
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
    ]*/
 
    func setupUI() {

        
        setupCollectionView(collection: kitchenCollectionView)
        
        kitchenCollectionView.register(UINib(nibName: "ClothingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }

}
