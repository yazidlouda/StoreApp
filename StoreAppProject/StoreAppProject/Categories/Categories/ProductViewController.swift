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
   

    
    let rating = [4.0,3.0,2.5,4.5,5.0,3.6,4.0,2.0,1.0,3.5,]

 
    func setupUI() {

       
        setupCollectionView(collection: productCollectionView)
        
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
    
   
}

