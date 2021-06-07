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

//            return clothingProducts!.count
//        case kitchenCollectionView:
//            return kitchenProducts!.count
//        case outdoorCollectionView:
//            return outdoorsProducts!.count

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
            
            cell.setupClothingCell(product: clothingProducts![indexPath.item])
            return cell
        case kitchenCollectionView:
            let cell = kitchenCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! KitchenCollectionViewCell
            
            cell.setupKitchenCell(product: kitchenProducts![indexPath.item])
            return cell
        case outdoorCollectionView:
            let cell = outdoorCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! OutdoorCollectionViewCell
            
            cell.setupOutdoorCell(product: outdoorsProducts![indexPath.item])
            
            return cell
            
      
        default:return UICollectionViewCell()
            
      
     
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        //UIView.animate(withDuration: 0.2,animations: {cell?.alpha = 0.5}) {[weak self] (completed) in
         //fade in
        //UIView.animate(withDuration: 0.2,animations: {
         //Fade out
        //guard let self = self else {return}
        //cell?.alpha = 1
            
            if collectionView == self.clothingCollectionView {
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
            
                viewController.username = self.username
                viewController.phone = self.phone
                viewController.product = self.clothingProducts![indexPath.item]
               // viewController?.index  = indexPath.item
                
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()
                
                self.present(viewController, animated: true, completion: nil)
                ItemViewController.dt = "popular"
            }
            if collectionView == self.kitchenCollectionView {
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
            
                viewController.username = self.username
                viewController.phone = self.phone

                viewController.product = self.kitchenProducts?[indexPath.item]
           

                
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()
                
                self.present(viewController, animated: true, completion: nil)
                ItemViewController.dt = "featured"
            }
            if collectionView == self.outdoorCollectionView {
                
                let viewController =  self.storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
            
                viewController.username = self.username
                viewController.phone = self.phone
                viewController.product = self.outdoorsProducts![indexPath.item]
                //viewController?.index  = indexPath.item
                
                let haptic = UIImpactFeedbackGenerator(style: .soft)
                haptic.impactOccurred()
                

                self.present(viewController, animated: true, completion: nil)
                ItemViewController.dt = "deals"
            }
            else {
            
       
        print("")
            }
        })

    }

    
   

}
