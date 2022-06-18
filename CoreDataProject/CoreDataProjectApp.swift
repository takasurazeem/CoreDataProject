//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 10/05/2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            OneToManyExampleContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
