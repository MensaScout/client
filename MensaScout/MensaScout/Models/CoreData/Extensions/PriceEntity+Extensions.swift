//
//  PriceEntity+Extensions.swift
//  MensaScout
//
//  Created by Lars Winzer on 08.11.25.
//

import Foundation

extension PriceEntity {
    var category: PriceCategory? {
        get {
            PriceCategory(rawValue: categoryRaw ?? "") ?? nil
        }
        set {
            categoryRaw = newValue?.rawValue
        }
    }
}
