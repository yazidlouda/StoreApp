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
    var filteredData:[Item]!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        searchBar.delegate = self
        filteredData = homeGood
        // Do any additional setup after loading the view.
    }
    
    var homeGood:[Item] = [
        Item(name: "Elliot", price: 39.99, image: UIImage(named: "8")!, description: "The Elliot is a modern. "),
        Item(name: "Bellona", price: 59.99, image: UIImage(named: "8")!, description: "The Bellona is a stylish ."),
        Item(name: "Clubmaster", price: 99.99, image: UIImage(named: "8")!, description: " Clubmaster is the iconic."),
        Item(name: "Amelia", price: 29.99, image: UIImage(named: "8")!, description: "The Amelia E. Hepburn is a modern cat-eye "),
        Item(name: "Ottoto", price: 49.99, image: UIImage(named: "8")!, description: "The Ottoto  is a full-rimmed."),
        Item(name: "Andria", price: 69.99, image: UIImage(named: "8")!, description: "The Andria is a well-rounded frame ."),
        Item(name: "Revel", price: 79.99, image: UIImage(named: "8")!, description: "The Revel  is a wrap-around ."),
        Item(name: "Vogue", price: 39.99, image: UIImage(named: "8")!, description: "The Vogue VO5051S is a modern ."),
        Item(name: "Muse Ivor", price: 149.99, image: UIImage(named: "8")!, description: "The Muse Ivor is a effortlessly cool ."),
        Item(name: "Coach", price: 49.99, image: UIImage(named: "8")!, description: "The Coach HC8179 is an oversized square ."),
    ]
 
    func setupUI() {

       
        setupCollectionView(collection: homeGoodCollectionView)
        
        homeGoodCollectionView.register(UINib(nibName: "ClothingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
}
