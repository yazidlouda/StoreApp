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
    @IBOutlet weak var productCollectionView: UICollectionView!
    var filteredData:[Item]!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        searchBar.delegate = self
        filteredData = product
        numberOfItems.text = filteredData.count.description
        productCollectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    var product:[Item] = [
        Item(name: "Elliot", price: 39.99, image: UIImage(named: "5")!, description: "The Elliot is a modern. "),
        Item(name: "Bellona", price: 59.99, image: UIImage(named: "5")!, description: "The Bellona is a stylish ."),
        Item(name: "Clubmaster", price: 99.99, image: UIImage(named: "5")!, description: " Clubmaster is the iconic."),
        Item(name: "Amelia", price: 29.99, image: UIImage(named: "5")!, description: "The Amelia E. Hepburn is a modern cat-eye "),
        Item(name: "Ottoto", price: 49.99, image: UIImage(named: "5")!, description: "The Ottoto  is a full-rimmed."),
        Item(name: "Andria", price: 69.99, image: UIImage(named: "5")!, description: "The Andria is a well-rounded frame ."),
        Item(name: "Revel", price: 79.99, image: UIImage(named: "5")!, description: "The Revel  is a wrap-around ."),
        Item(name: "Vogue", price: 39.99, image: UIImage(named: "5")!, description: "The Vogue VO5051S is a modern ."),
        Item(name: "Muse Ivor", price: 149.99, image: UIImage(named: "5")!, description: "The Muse Ivor is a effortlessly cool ."),
        Item(name: "Coach", price: 49.99, image: UIImage(named: "5")!, description: "The Coach HC8179 is an oversized square ."),
    ]
 
    func setupUI() {

       
        setupCollectionView(collection: productCollectionView)
        
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
    
   
}
