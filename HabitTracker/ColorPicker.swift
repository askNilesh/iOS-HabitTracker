//
//  ColorPicker.swift
//  HabitTracker
//
//  Created by Nilesh Rathod on 19/05/23.
//

import SwiftUI

struct ColorPicker: View {
    @Binding var selectedColor: Color
       
       let colors: [Color] = [
           .red, .indigo, .purple, .orange,
           .blue, .yellow, .green, .pink, .brown
       ]
       
    var body: some View {
         let columns = [
             GridItem(.adaptive(minimum: 90)),
         ]
         
         LazyVGrid(columns: columns) {
             ForEach(colors, id: \.self) { color in
                 ZStack {
                     Circle()
                         .fill(color)
                         .frame(width: 30, height: 30)
                         .onTapGesture {
                             withAnimation{
                                 selectedColor = color
                             }
                         }
                         .padding(10)
                     
                     if selectedColor == color {
                         Circle()
                             .stroke(color, lineWidth: 10)
                             .frame(width: 50, height: 50)
                     }
                 }
             }
         }
     }
}

struct ColorPicker_Previews: PreviewProvider {
    @State static private var color: Color = .blue
    static var previews: some View {
        ColorPicker(selectedColor: $color)
    }
}
