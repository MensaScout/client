//
//  MealCardViewModel.swift
//  MensaScout
//
//  Created by Lars Winzer on 28.10.25.
//

import Foundation
import SwiftUI
internal import Combine

@MainActor
final class MealCardViewModel: ObservableObject {
    @Published private(set) var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var imageName: String? {
        meal.imageName
    }
    
    var title: String {
        meal.name
    }
    
    var nutrientPropertiesAssetNames: [String] {
        meal.nutrientProperties.map { $0.assetName }
    }
    
    var description: String {
        meal.description
    }
    
    var pricesStudent: String {
        String(format: "%.2f CHF", meal.prices.student)
    }
    
    var location: String {
        meal.location
    }
}
