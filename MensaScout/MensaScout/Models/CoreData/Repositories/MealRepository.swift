//
//  MealRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import CoreData

final class MealRepository {
    static func createMeal(
        externalId: String,
        category: String,
        media: String,
        offeredFrom: Date,
        offeredTo: Date,
        canteen: CanteenEntity,
        context: NSManagedObjectContext
    ) -> MealEntity {
        let meal = MealEntity(context: context)
        meal.externalId = externalId
        meal.category = category
        meal.media = media
        meal.offeredFrom = offeredFrom
        meal.offeredTo = offeredTo
        
        meal.canteen = canteen
        canteen.meals?.adding(meal)
        
        return meal
    }
}
