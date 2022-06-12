//
//  DataController.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 10/05/2022.
//

import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
}
