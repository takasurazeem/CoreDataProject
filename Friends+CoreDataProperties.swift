//
//  Friends+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 15/06/2022.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}

extension Friend : Identifiable {
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    var wrappedlastName: String {
        lastName ?? "Unknown"
    }
}
