//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 15/06/2022.
//

import SwiftUI
import CoreData

enum Predicate: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
    case greaterThan = ">"
    case lessThan = "<"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { object in
            self.content(object)
        }
    }
    
    init(sortDescriptors: [SortDescriptor<T>] = [], filterKey: String, filterValue: String, pradicate: Predicate = .beginsWith, @ViewBuilder content: @escaping (T) -> Content) {
        //BEGINSWITH[c] for case insensivity
        _fetchRequest = FetchRequest(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(pradicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}

