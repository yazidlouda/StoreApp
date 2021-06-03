//
//  ProductViewController+Extension.swift
//  StoreAppProject
//
//  Created by Home on 5/28/21.
//

import UIKit
extension ProductViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView(collection:UICollectionView) {
        collection.delegate = self
        collection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
            

            cell.setupProductCell(product: filteredData[indexPath.item])

           
        
        //Method to display rating in product view
            cell.setupRating(ratt: rating[indexPath.row])
            return cell
       
            
      
            
        }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = products
            numberOfItems.text = filteredData.count.description
            productCollectionView.reloadData()
        }else{
            for db in products! {
                var name = db.name!
                if (name.lowercased().contains(searchText.lowercased())){
                    filteredData.append(db)
                    numberOfItems.text = filteredData.count.description
                    productCollectionView.reloadData()
                }
            }
        }
        self.productCollectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2,animations: {cell?.alpha = 0.5}) {[weak self] (completed) in
         //fade in
        UIView.animate(withDuration: 0.2,animations: {
         //Fade out
        guard let self = self else {return}
        cell?.alpha = 1
            
         
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
                /*
                viewController?.image = self.product[indexPath.item].image
                viewController?.name = self.product[indexPath.item].name
                viewController?.itemInfo = self.product[indexPath.item].description
                viewController?.index  = indexPath.item

                */
                viewController.username = self.username
                viewController.phone = self.phone
                viewController.product = self.products?[indexPath.item]

                viewController?.price = self.product[indexPath.item].price
                viewController?.rat1 = self.rating[indexPath.row]

            
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()
                
                self.present(viewController, animated: true, completion: nil)
                
            ItemViewController.dt = "product"
          
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
