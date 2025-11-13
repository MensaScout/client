//
//  PriceCategory.swift
//  MensaScout
//
//  Created by Lars Winzer on 07.11.25.
//

import Foundation

enum PriceCategory: String, CaseIterable, Codable {
    case employee = "Employee"
    case student = "Student"
    case extern = "Extern"
}
