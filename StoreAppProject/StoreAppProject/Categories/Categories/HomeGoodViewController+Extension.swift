//
//  HomeGoodViewController+Extension.swift
//  StoreAppProject
//
//  Created by Home on 5/27/21.
//

import UIKit
extension HomeGoodViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView(collection:UICollectionView) {
        collection.delegate = self
        collection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
            let cell = homeGoodCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ClothingCollectionViewCell
            
            //cell.setupClothingCell(item: filteredData[indexPath.item])
            return cell
       
            
      
      
            
        }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = homeGood
        }else{
            for db in homeGood {
                if (db.name.lowercased().contains(searchText.lowercased())){
                    filteredData.append(db)
                }
            }
        }
        self.homeGoodCollectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2,animations: {cell?.alpha = 0.5}) {[weak self] (completed) in
         //fade in
        UIView.animate(withDuration: 0.2,animations: {
         //Fade out
        guard let self = self else {return}
        cell?.alpha = 1
            
         
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as? ItemViewController
            /*
                viewController?.image = self.homeGood[indexPath.item].image
                viewController?.name = self.homeGood[indexPath.item].name
                viewController?.itemInfo = self.homeGood[indexPath.item].description
                viewController?.index  = indexPath.item
                */
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()
                
                self.present(viewController!, animated: true, completion: nil)
                
            ItemViewController.dt = "homeGood"
          
        })
    }
}
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let rotationtransForm = CATransform3DTranslate(CATransform3DIdentity, -800, 100, 0)
        cell.layer.transform = rotationtransForm
        UIView.animate(withDuration: 0.3) {cell.layer.transform = CATransform3DIdentity}
        cell.alpha = 0
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1
        }
    }
}
