//
//  AddressRepository.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.11.25.
//

import Foundation
import CoreData

final class AddressRepository {
    static func createAddress(
        addressLine1: String,
        addressLine2: String?,
        city: String,
        country: String,
        zipCode: String,
        canteen: CanteenEntity,
        context: NSManagedObjectContext
    ) -> AddressEntity {
        let address = AddressEntity(context: context)
        address.addressLine1 = addressLine1
        address.addressLine2 = addressLine2
        address.city = city
        address.country = country
        address.zipCode = zipCode

        address.canteen = canteen
        canteen.address = address
        
        return address
    }

    static func createAddress(
        addressLine1: String,
        addressLine2: String?,
        city: String,
        country: String,
        zipCode: String,
        canteenOperator: CanteenOperatorEntity,
        context: NSManagedObjectContext
    ) -> AddressEntity {
        let address = AddressEntity(context: context)
        address.addressLine1 = addressLine1
        address.addressLine2 = addressLine2
        address.city = city
        address.country = country
        address.zipCode = zipCode

        address.canteenOperator = canteenOperator
        canteenOperator.address = address
        
        return address
    }
}

