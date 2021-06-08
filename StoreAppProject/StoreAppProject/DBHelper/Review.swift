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
    
    func getReviewScore() -> Int {
        var reviewScore = 0
        var numOfReviews = 0
        let calculatedScore = {reviewScore / numOfReviews}
        var reviews = [Review]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Review")
        
        do {
            reviews = try context?.fetch(fetchReq) as! [Review]
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        for review in reviews {
            reviewScore += Int(review.rating)
            numOfReviews += 1
        }
        return calculatedScore()
        
    }
    
}
