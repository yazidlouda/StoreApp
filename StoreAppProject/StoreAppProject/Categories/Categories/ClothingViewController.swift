//
//  ClothingViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/27/21.
//

import UIKit

class ClothingViewController: UIViewController {

    @IBOutlet weak var clothingCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    var clothing:[Item] = [
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
 
    func setupUI() {

       
        setupCollectionView(collection: clothingCollectionView)
        
        clothingCollectionView.register(UINib(nibName: "ClothingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
      
    }
}
