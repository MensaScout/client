//
//  MealStruct.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import Foundation
import SwiftUI

enum NutrientProperties: String {
    case beef, poultry, veal, green_choice, low_co2, low_gluten, low_lactose, pork, seafood, fish, vegan, vegetarian, spicy
    
    var assetName: String {
        switch self {
            case .beef:
                return "beef"
            case .poultry:
                return "poultry"
            case .veal:
                return "veal"
            case .green_choice:
                return "green_choice"
            case .low_co2:
                return "low_co2"
            case .low_gluten:
                return "low_gluten"
            case .low_lactose:
                return "low_lactose"
            case .pork:
                return "pork"
            case .seafood:
                return "seafood"
            case .fish:
                return "fish"
            case .vegan:
                return "vegan"
            case .vegetarian:
                return "vegetarian"
            case .spicy:
                return "spicy"
        }
    }
    
    var asString: String {
        switch self {
            case .beef:
                return "Beef"
            case .poultry:
                return "Poultry"
            case .veal:
                return "Veal"
            case .green_choice:
                return "Green choice"
            case .low_co2:
                return "Climate friendly"
            case .low_gluten:
                return "Low gluten"
            case .low_lactose:
                return "Low lactose"
            case .pork:
                return "Pork"
            case .seafood:
                return "Seafood"
            case .fish:
                return "Fish"
            case .vegan:
                return "Vegan"
            case .vegetarian:
                return "Vegetarian"
            case .spicy:
                return "Spicy"
        }
    }
}

struct MealPrices {
    let student: Double
    let staff: Double
    let external: Double
}

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
