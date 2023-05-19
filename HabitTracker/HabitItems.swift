//
//  HabitItems.swift
//  HabitTracker
//
//  Created by Nilesh Rathod on 19/05/23.
//

import Foundation

class HabitItems : ObservableObject{
    @Published var items = [HabitItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encode = try? encoder.encode(items){
                UserDefaults.standard.set(encode, forKey: "ITEMS")
            }
        }
    }
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: "ITEMS"){
            if let decodeItem = try? JSONDecoder().decode([HabitItem].self, from: savedItem) {
                items = decodeItem
                return
            }
            
        }
        
        items = [HabitItem]()
    }
}
