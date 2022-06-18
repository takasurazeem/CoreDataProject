//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 18/06/2022.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

}

extension Candy : Identifiable {
    
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
    
}
