//
//  CanteenRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class CanteenRepository {
    static func createCanteen(
        externalId: String,
        name: String,
        address: AddressEntity,
        canteenOperator: CanteenOperatorEntity,
        openingPeriods: [OpeningPeriodEntity],
        context: NSManagedObjectContext
    ) -> CanteenEntity {
        let canteen = CanteenEntity(context: context)
        canteen.externalId = externalId
        canteen.name = name
        
        canteen.address = address
        canteen.canteenOperator = canteenOperator
        canteen.openingPeriods?.addingObjects(from: openingPeriods)
        
        return canteen
    }
}
