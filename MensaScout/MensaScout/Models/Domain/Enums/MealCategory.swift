//
//  MealCategory.swift
//  MensaScout
//
//  Created by Lars Winzer on 07.11.25.
//

import Foundation

enum MealCategory: String, CaseIterable, Codable {
    case vital = "Vital"
    case classic = "Classic"
    case plantsAndMore = "Plants & More"
    case salatAndAntipasti = "Salat & Antipasti"
}
