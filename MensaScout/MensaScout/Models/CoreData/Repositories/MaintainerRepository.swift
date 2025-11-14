//
//  MaintainerRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class MaintainerRepository {
    static func createMaintainer(
        name: String,
        username: String,
        linkToProfile: String,
        context: NSManagedObjectContext
    ) -> MaintainerEntity {
        let maintainer = MaintainerEntity(context: context)
        maintainer.name = name
        maintainer.username = username
        maintainer.linkToProfile = linkToProfile
        
        return maintainer
    }
}
