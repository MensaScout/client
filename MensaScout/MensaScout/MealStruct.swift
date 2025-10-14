//
//  MealStruct.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import Foundation
import SwiftUI

enum MealType: String {
    case meat = "meat"
    case vegetarian = "vegetarian"
    case vegan = "vegan"
    
    var symbol: String {
        switch self {
        case .meat:
            return "🍖"
        case .vegetarian:
            return "🥗"
        case .vegan:
            return "🥬"
        }
    }
    
    var color: Color {
        switch self {
            case .meat: return .red
            case .vegetarian: return .green
            case .vegan: return .mint
        }
    }
}

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let type: MealType
    let priceCHF: Double
    let location: String
    let imageName: String?
}
