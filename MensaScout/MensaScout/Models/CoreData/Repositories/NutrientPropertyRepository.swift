//
//  NutrientPropertyRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class NutrientPropertyRepository {
    static func createNutrientProperty(
        type: NutrientPropertyType,
        unit: NutrientPropertyUnit,
        amount: Int,
        meal: MealEntity,
        context: NSManagedObjectContext
    ) -> NutrientPropertyEntity {
        let nutrientProperty = NutrientPropertyEntity(context: context)
        nutrientProperty.type = type
        nutrientProperty.unit = unit
        nutrientProperty.amount = Int32(amount)
        
        nutrientProperty.meal = meal
        meal.nutrientProperties?.adding(nutrientProperty)
        
        return nutrientProperty
    }
}
