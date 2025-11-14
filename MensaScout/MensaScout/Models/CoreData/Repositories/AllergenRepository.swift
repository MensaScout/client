//
//  AllergenRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class AllergenRepository {
    static func createAllergen(
        name: String,
        meal: MealEntity,
        context: NSManagedObjectContext
    ) -> AllergenEntity {
        let allergen = AllergenEntity(context: context)
        allergen.name = name
        
        allergen.meal = meal
        meal.allergens?.adding(allergen)
        
        return allergen
    }
}
