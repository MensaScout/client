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
    
    static func fetchMealsForToday(
        canteen: CanteenEntity,
        context: NSManagedObjectContext
    ) -> [MealEntity]? {
        let request = MealEntity.fetchRequest()
        
        let today = Date()
        request.predicate = NSPredicate(
            format: "offeredFrom >= %@ AND offeredTo <= %@",
            today.startOfDay as CVarArg,
            today.endOfDay as CVarArg
        )
        
        return try? context.fetch(request)
    }
}
