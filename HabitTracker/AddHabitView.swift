//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Nilesh Rathod on 19/05/23.
//

import SwiftUI

struct AddHabitView: View {
    
    @ObservedObject var habitItems : HabitItems
    
    @Environment(\.dismiss) var dismiss
    @State private var habitName : String = ""
    @State private var habitDescription : String = ""
    
    @State  private var selectedColor: Color = .blue
    @State private var color: Color = .red
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Habit Name", text: $habitName)
                    TextField("Habit Description", text: $habitDescription)
                }
                
                Section {
                    ColorPicker(selectedColor: $selectedColor)
                }
                
            }
            .navigationTitle("Add a new habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItemGroup(placement: .primaryAction){
                    
                    Button {
                        let habit = HabitItem (
                            name: habitName,
                            description: habitDescription,
                            colorName: Color.habitColors[color, default: "Red"] ?? ""
                        )
                        habitItems.items.append(habit)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

//struct AddHabitView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddHabitView()
//    }
//}
