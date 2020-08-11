//
//  ContentView.swift
//  TaskList
//
//  Created by Denis Tsoi on 11/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Combine
import SwiftUI

struct ContentView: View {
  @ObservedObject var taskStore: TaskStore
  
  @State var modalIsVisible = false
    var body: some View {
      NavigationView {
        List(taskStore.tasks) {
          task in Text(task.name)
        }
        .navigationBarTitle("Tasks")
        .navigationBarItems(
          trailing:
            Button(action: {
              self.modalIsVisible = true
            }) {
              Image(systemName: "plus")
            }
        )
      }
      .sheet(isPresented: $modalIsVisible) {
        NewTaskView(taskStore: self.taskStore)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
