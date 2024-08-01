//
//  NewToDoView.swift
//  finalProjectGroup1
//
//  Created by Scholar on 01/08/2024.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack{
            Text("Task Title: ")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                  .padding()
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
            }
            Button {
                addToDo()
                self.showNewTask = false
            } label: {
                    Text("Save")
            }
            
            
        }
        .padding()
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

//#Preview {
//    NewToDoView()
//}
