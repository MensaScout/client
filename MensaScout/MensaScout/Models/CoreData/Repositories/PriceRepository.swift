//
//  PriceRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class PriceRepository {
    static func createPrice(
        category: PriceCategory,
        currency: String,
        amount: Float,
        meal: MealEntity,
        context: NSManagedObjectContext
    ) -> PriceEntity {
        let price = PriceEntity(context: context)
        price.category = category
        price.currency = currency
        price.amount = amount
        
        price.meal = meal
        meal.prices?.adding(price)
        
        return price
    }
}
