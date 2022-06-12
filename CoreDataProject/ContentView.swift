//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 10/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var names: FetchedResults<Names>
    
    var body: some View {
        VStack {
            List(names, id: \.self) { name in
                Text(name.name ?? "Unknown")
            }
            
            Button("Add") {
                let name = Names(context: moc)
                name.name = "Takasur Azeem"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
