//
//  OpeningPeriodRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class OpeningPeriodRepository {
    static func createOpeningPeriod(
        start: Date,
        end: Date,
        validFrom: Date,
        validTo: Date,
        canteen: CanteenEntity,
        context: NSManagedObjectContext
    ) -> OpeningPeriodEntity {
        let openingPeriod = OpeningPeriodEntity(context: context)
        openingPeriod.start = start
        openingPeriod.end = end
        openingPeriod.validFrom = validFrom
        openingPeriod.validTo = validTo
        
        openingPeriod.canteen = canteen
        canteen.openingPeriods?.adding(openingPeriod)
        
        return openingPeriod
    }
}
