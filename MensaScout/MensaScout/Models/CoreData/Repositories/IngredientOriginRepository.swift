//
//  IngredientOriginRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class IngredientOriginRepository {
    static func createIngredientOrigin(
        animal: String,
        country: String,
        type: IngredientOriginType,
        meal: MealEntity,
        context: NSManagedObjectContext
    ) -> IngredientOriginEntity {
        let ingredientOrigin = IngredientOriginEntity(context: context)
        ingredientOrigin.animal = animal
        ingredientOrigin.country = country
        ingredientOrigin.type = type
        
        ingredientOrigin.meal = meal
        meal.ingredientOrigins?.adding(ingredientOrigin)
        
        return ingredientOrigin
    }
}
