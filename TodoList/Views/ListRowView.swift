//
//  ListRowView.swift
//  TodoList
//
//  Created by APPLE on 8/29/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: itemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer() // used to check everything is on left side
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview("This is the first title") {
    Group {
        ListRowView(item: itemModel(title: "This is the first item", isCompleted: false))
        ListRowView(item: itemModel(title: "This is the second item", isCompleted: true))
    }
        .previewLayout(.sizeThatFits)
}

#Preview("This is the second title") {
    ListRowView(item: itemModel(title: "This is the second item", isCompleted: true))
}
