//
//  MaintainerAssignmentRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class MaintainerAssignmentRepository {
    static func createMaintainerAssignment(
        role: String,
        canteenOperator: CanteenOperatorEntity,
        maintainer: MaintainerEntity,
        context: NSManagedObjectContext
    ) -> MaintainerAssignmentEntity {
        let maintainerAssignment = MaintainerAssignmentEntity(context: context)
        maintainerAssignment.role = role
        
        maintainerAssignment.canteenOperator = canteenOperator
        canteenOperator.maintainerAssignments?.adding(maintainerAssignment)
        maintainerAssignment.maintainer = maintainer
        maintainer.maintainerAssignments?.adding(maintainerAssignment)
        
        return maintainerAssignment
    }
}
