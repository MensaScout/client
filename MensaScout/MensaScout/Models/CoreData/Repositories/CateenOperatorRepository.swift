//
//  CateenOperatorRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class CanteenOperatorRepository {
    static func createCanteenOperator(
        externalId: String,
        name: String,
        address: AddressEntity,
        context: NSManagedObjectContext
    ) -> CanteenOperatorEntity {
        let canteenOperator = CanteenOperatorEntity(context: context)
        canteenOperator.externalId = externalId
        canteenOperator.name = name
        
        canteenOperator.address = address
        
        return canteenOperator
    }
}
