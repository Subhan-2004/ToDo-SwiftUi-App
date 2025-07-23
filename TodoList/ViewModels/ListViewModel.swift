//
//  ListViewModel.swift
//  TodoList
//
//  Created by APPLE on 8/30/24.
//

import Foundation

/*
 CRUD Functions
 
 Create
 Read
 Update 
 Delete
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [itemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            itemModel(title: "1st", isCompleted: true),
//            itemModel(title: "2nd", isCompleted: false),
//            itemModel(title: "3rd", isCompleted: true),
//        ]
//        items.append(contentsOf: newItems)
        
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([itemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: itemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletition()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
