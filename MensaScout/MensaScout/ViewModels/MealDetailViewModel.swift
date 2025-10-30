//
//  MealDetailViewModel.swift
//  MensaScout
//
//  Created by Lars Winzer on 22.10.25.
//

import Foundation
import SwiftUI
internal import Combine

@MainActor
final class MealDetailViewModel: ObservableObject {
    @Published private(set) var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var imageName: String? {
        meal.imageName
    }
    
    var imageExists: Bool {
        meal.imageName != nil
    }
    
    var title: String {
        meal.name
    }
    
    var category: String? {
        meal.category
    }
    
    var description: String {
        meal.description
    }
    
    var nutrientPropertiesText: String? {
        guard !meal.nutrientProperties.isEmpty else { return nil }
        return meal.nutrientProperties.map { $0.asString }.joined(separator: ", ")
    }
        
    var allergensText: String? {
        guard !meal.allergens.isEmpty else { return nil }
        return meal.allergens.joined(separator: ", ")
    }
    
    var pricesText: [(String, String)] {
        [
            ("Studierende", String(format: "%.2f CHF", meal.prices.student)),
            ("Angestellte", String(format: "%.2f CHF", meal.prices.staff)),
            ("Externe", String(format: "%.2f CHF", meal.prices.external))
        ]
    }
    
    var locationText: String {
        meal.location
    }
    
    var websiteURL: URL? {
        meal.websiteURL
    }
    
    var openingHoursText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return "\(formatter.string(from: meal.openingHours.start)) - \(formatter.string(from: meal.openingHours.end)) Uhr"
    }
    
    var openingHoursStatus: String {
        let now = Date()
        let openingHours = meal.openingHours
        
        if openingHours.contains(now) {
            let remaining = openingHours.end.timeIntervalSince(now)
            return remaining < 15 * 60 ? "schließt bald" : "geöffnet"
        } else if now < openingHours.start {
            let untilOpen = openingHours.start.timeIntervalSince(now)
            return untilOpen < 15 * 60 ? "öffnet bald" : "geschlossen"
        } else {
            return "geschlossen"
        }
    }
}
