//
//  Allergen.swift
//  MensaScout
//
//  Created by Lars Winzer on 07.11.25.
//

import Foundation

enum Allergen: String, CaseIterable, Codable {
    case lactose = "Lactose"
    case nuts = "Nuts"
    case cerealsContainingGluten = "CerealsContainingGluten"
    case milk = "Milk"
    case soy = "Soy"
    case eggs = "Eggs"
    case celery = "Celery"
    case mustard = "Mustard"
    case fish = "Fish"
    case crustaceans = "Crustaceans"
    case molluscs = "Molluscs"
}
