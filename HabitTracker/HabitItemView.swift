//
//  HabitItemView.swift
//  HabitTracker
//
//  Created by Nilesh Rathod on 19/05/23.
//

import SwiftUI

struct HabitItemView: View {
    let habit : HabitItem
    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.name)
                .font(.title)
                .foregroundColor(habit.color ?? .black)
            
            Text(habit.description)
                .font(.body )
                .multilineTextAlignment(.center)
            
        }
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

struct HabitItemView_Previews: PreviewProvider {
    static var previews: some View {
        HabitItemView(habit: HabitItem (
            name: "habitName",
            description: "habitDescription",
            colorName: Color.habitColors[.red, default: "Red"] ?? ""
        ))
    }
}
