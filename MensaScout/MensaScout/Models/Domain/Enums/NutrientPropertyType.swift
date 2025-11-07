//
//  NutrientPropertyType.swift
//  MensaScout
//
//  Created by Lars Winzer on 07.11.25.
//

import Foundation

enum NutrientPropertyType: String, CaseIterable, Codable {
    case servingWeight = "ServingWeight"
    case totalWeight = "TotalWeight"
    case co2Emissions = "CO2Emissions"
    case energy = "Energy"
    case fat = "Fat"
    case carbohydrates = "Carbohydrates"
    case sugar = "Sugar"
    case protein = "Protein"
    case salt = "Salt"
    case fibers = "Fibers"
    case fruits = "Fruits"
    case vegetables = "Vegetables"
}
