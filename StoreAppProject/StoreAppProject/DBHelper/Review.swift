//
//  Review.swift
//  StoreAppProject
//
//  Created by Scott Benson on 6/7/21.
//

import Foundation
import CoreData

extension DBHelper {
    static var currentProduct : Product = Product()

    func addReview(_ comment: String, _ dateCreated: Date, _ rating: Double, _ product: Product) {
        let user = DBHelper.currentUser
        let review = NSEntityDescription.insertNewObject(forEntityName: "Review", into: context!) as! Review
        
        review.comment = comment
        review.dateCreated = dateCreated
        review.product = product
        review.rating = Int16(rating)
        
        do {
            try context?.save()
            print("Review added - Details: \(review)")
        } catch(let exception) {
            print(exception.localizedDescription)
        }
    }
    
    func getReviewScore() -> Double {
        var reviewScore = 0
        var numOfReviews = 0
        var calculatedScore : Double = 0.0
        
        let review = DBHelper.currentProduct.reviews?.allObjects
        for rev in review! {
            numOfReviews += 1
            reviewScore += Int((rev as AnyObject).rating!)
            calculatedScore = Double(reviewScore / numOfReviews)
        }
        return calculatedScore
    }
    
}
