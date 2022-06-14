//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Takasur Azeem on 10/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var firstNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "firstName", filterValue: firstNameFilter) { (friend: Friend) in
                Text("\(friend.wrappedFirstName) \(friend.wrappedlastName)")
            }
            
            Button("Add Friends") {
                let friend1 = Friend(context: moc)
                friend1.firstName = "Ahmed"
                friend1.lastName = "Raza"
                
                let friend2 = Friend(context: moc)
                friend2.firstName = "Ali"
                friend2.lastName = "Ilyas"
                
                let friend3 = Friend(context: moc)
                friend3.firstName = "Hammad"
                friend3.lastName = "Afzal"
                
                let friend4 = Friend(context: moc)
                friend4.firstName = "Hamza"
                friend4.lastName = "Paa G"
                
                try? moc.save()
            }
            
            Button("Show A") {
                firstNameFilter = "A"
            }
            
            Button("Show H") {
                firstNameFilter = "H"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
