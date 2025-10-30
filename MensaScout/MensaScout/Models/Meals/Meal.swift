//
//  Meal.swift
//  MensaScout
//
//  Created by Lars Winzer on 20.10.25.
//

import Foundation

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let nutrientProperties: [NutrientProperties]
    let category: String?
    let allergens: [String]
    let prices: MealPrices
    let location: String
    let imageName: String?
    let websiteURL: URL?
    let openingHours: DateInterval
    
    init(
        name: String,
        description: String,
        nutrientProperties: [NutrientProperties],
        category: String?,
        allergens: [String],
        prices: MealPrices,
        location: String,
        imageName: String? = nil,
        websiteURL: URL?,
        openingHours: DateInterval
    ) {
        self.name = name
        self.description = description
        self.nutrientProperties = nutrientProperties
        self.category = category
        self.allergens = allergens
        self.prices = prices
        self.location = location
        self.imageName = imageName
        self.websiteURL = websiteURL
        self.openingHours = openingHours
    }
}

struct MealPrices {
    let student: Double
    let staff: Double
    let external: Double
}
