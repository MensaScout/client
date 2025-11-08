//
//  NSManagedObjectContext.swift
//  MensaScout
//
//  Created by Lars Winzer on 08.11.25.
//

import CoreData

extension NSManagedObjectContext {
    func saveIfNeeded() throws {
        if hasChanges {
            try save()
        }
    }
}
