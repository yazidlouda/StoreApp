//
//  UserDashboardViewController+Extension.swift
//  StoreAppProject
//
//  Created by Home on 5/25/21.
//

import UIKit


extension UserDashboardViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView(collection:UICollectionView) {
        collection.delegate = self
        collection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case clothingCollectionView:
            return clothing.count
        case kitchenCollectionView:
            return kitchen.count
        case outdoorCollectionView:
            return outdoor.count
        default:return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case clothingCollectionView:
            let cell = clothingCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ClothingCollectionViewCell
            cell.setupClothingCell(product: (products?[indexPath.item])!)
            //cell.setupClothingCell(item: clothing[indexPath.item])
            return cell
        case kitchenCollectionView:
            let cell = kitchenCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! KitchenCollectionViewCell
            
            cell.setupKitchenCell(item: kitchen[indexPath.item])
            return cell
        case outdoorCollectionView:
            let cell = outdoorCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! OutdoorCollectionViewCell
            
            cell.setupOutdoorCell(item: kitchen[indexPath.item])
            
            return cell
            
      
        default:return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2,animations: {cell?.alpha = 0.5}) {[weak self] (completed) in
         //fade in
        UIView.animate(withDuration: 0.2,animations: {
         //Fade out
        guard let self = self else {return}
        cell?.alpha = 1
            
            if collectionView == self.clothingCollectionView {
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as? ItemViewController
            
                /*viewController?.image = self.clothing[indexPath.item].image
                viewController?.name = self.clothing[indexPath.item].name
                viewController?.itemInfo = self.clothing[indexPath.item].description
                viewController?.index  = indexPath.item*/
                viewController?.username = self.username
                viewController?.phone = self.phone
                viewController?.product = self.products?[indexPath.item]
                
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()
                
                self.present(viewController!, animated: true, completion: nil)
                
            }
            if collectionView == self.kitchenCollectionView {
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as? ItemViewController
                /*
                viewController?.image = self.kitchen[indexPath.item].image
                viewController?.name = self.kitchen[indexPath.item].name
                viewController?.itemInfo = self.kitchen[indexPath.item].description
                viewController?.index  = indexPath.item
                
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()*/
                
                self.present(viewController!, animated: true, completion: nil)
                
            }
            if collectionView == self.outdoorCollectionView {
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as? ItemViewController
            /*
                viewController?.image = self.outdoor[indexPath.item].image
                viewController?.name = self.outdoor[indexPath.item].name
                viewController?.itemInfo = self.outdoor[indexPath.item].description
                viewController?.index  = indexPath.item
                
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()
                */
                self.present(viewController!, animated: true, completion: nil)
                
            }
            else {
            
       
        print("")
            }
        })
    }
}
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
//        let rotationtransForm = CATransform3DTranslate(CATransform3DIdentity, -800, 100, 0)
//        cell.layer.transform = rotationtransForm
//        UIView.animate(withDuration: 0.3) {cell.layer.transform = CATransform3DIdentity}
//        cell.alpha = 0
//        UIView.animate(withDuration: 0.5) {
//            cell.alpha = 1
//        }
    }
}
