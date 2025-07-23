//
//  ListView.swift
//  TodoList
//
//  Created by APPLE on 8/29/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(DefaultListStyle())
            }
        }
        
        .navigationTitle("Todo List 📝")
        .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                  EditButton()
              }
              ToolbarItem(placement: .navigationBarTrailing) {
                  NavigationLink("Add", destination: AddView())
              }
          }
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}


