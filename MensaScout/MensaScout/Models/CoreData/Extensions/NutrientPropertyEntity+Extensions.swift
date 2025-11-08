//
//  NutrientPropertyEntity+Extensions.swift
//  MensaScout
//
//  Created by Lars Winzer on 08.11.25.
//

import Foundation

extension NutrientPropertyEntity {
    var type: NutrientPropertyType? {
        get {
            NutrientPropertyType(rawValue: typeRaw ?? "") ?? nil
        }
        set {
            typeRaw = newValue?.rawValue
        }
    }
    
    var unit: NutrientPropertyUnit? {
        get {
            NutrientPropertyUnit(rawValue: typeRaw ?? "") ?? nil
        }
        set {
            typeRaw = newValue?.rawValue
        }
    }
}
