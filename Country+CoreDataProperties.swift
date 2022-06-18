//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 18/06/2022.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var shortName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var candy: NSSet?

}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {
    
    var wrappedShortName: String {
        shortName ?? "Unknown Short Name"
    }
    
    var wrappedFullName: String {
        fullName ?? "Unknown Full Name"
    }
    
    var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        
        return set.sorted { $0.wrappedName < $1.wrappedName }
    }
    
}
