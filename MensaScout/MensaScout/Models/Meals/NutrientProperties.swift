//
//  NutrientProperties.swift
//  MensaScout
//
//  Created by Lars Winzer on 20.10.25.
//

import Foundation

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
