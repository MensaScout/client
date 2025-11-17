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
        validTo: Date?,
        canteen: CanteenEntity,
        context: NSManagedObjectContext
    ) -> OpeningPeriodEntity {
        let newPeriod = OpeningPeriodEntity(context: context)
        newPeriod.start = start
        newPeriod.end = end
        newPeriod.validFrom = validFrom
        newPeriod.validTo = validTo
        newPeriod.canteen = canteen
        
        if let previousPeriod = loadPreviousOpeningPeriod(
            context: context,
            canteen: canteen,
            before: validFrom
        ) {
            previousPeriod.validTo = validFrom
        }
        
        return newPeriod
    }
    
    static func loadPreviousOpeningPeriod(
        context: NSManagedObjectContext,
        canteen: CanteenEntity,
        before date: Date
    ) -> OpeningPeriodEntity? {
        let request = OpeningPeriodEntity.fetchRequest()

        request.predicate = NSPredicate(
            format: "canteen == %@ AND validFrom < %@",
            canteen, date as NSDate
        )
        
        request.sortDescriptors = [
            NSSortDescriptor(key: "validFrom", ascending: false)
        ]

        request.fetchLimit = 1

        return try? context.fetch(request).first
    }
}
