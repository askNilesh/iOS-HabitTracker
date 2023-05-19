//
//  ContentView.swift
//  HabitTracker
//
//  Created by Nilesh Rathod on 19/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddSheet = false
    @StateObject var habitItems =  HabitItems()
    var body: some View {
        NavigationView {
            List {
                ForEach(habitItems.items , id: \.id) { item in
                    HabitItemView(habit: item)
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("HabitTracker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showAddSheet){
            AddHabitView(habitItems: habitItems)
        }
        
        
    }
    func removeItem(at offset:IndexSet){
        habitItems.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
