//
//  IngredientOriginEntity+Extensions.swift
//  MensaScout
//
//  Created by Lars Winzer on 08.11.25.
//

import Foundation

extension IngredientOriginEntity {
    var type: IngredientOriginType? {
        get {
            IngredientOriginType(rawValue: typeRaw ?? "") ?? nil
        }
        set {
            typeRaw = newValue?.rawValue
        }
    }
}
