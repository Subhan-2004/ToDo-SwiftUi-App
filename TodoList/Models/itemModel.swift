//
//  itemModel.swift
//  TodoList
//
//  Created by APPLE on 8/29/24.
//

import Foundation

// IMMUTABLE struct

struct itemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletition() -> itemModel {
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

