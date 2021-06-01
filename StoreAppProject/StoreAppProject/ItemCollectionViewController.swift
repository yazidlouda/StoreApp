//
//  ItemCollectionViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import UIKit



class ItemCollectionViewController: UICollectionViewController {

    @IBOutlet var collectView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectView.dataSource = self
        collectView.delegate = self
     
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inventory.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      //  var cell = UICollectionViewCell()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ItemCollectionViewCell
            
        cell?.configure(with: inventory[indexPath.item])
        
        return cell!
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController =  storyboard?.instantiateViewController(identifier: "ItemViewController") as? ItemViewController
    
        /*viewController?.image = inventory[indexPath.item].image
        viewController?.name = inventory[indexPath.item].name
        viewController?.itemInfo = inventory[indexPath.item].description
        viewController?.price = inventory[indexPath.item].price
        viewController?.index  = indexPath.item*/
        
        
        let haptic = UIImpactFeedbackGenerator(style: .soft)
        haptic.impactOccurred()
        
        self.present(viewController!, animated: true, completion: nil)
    }
}
