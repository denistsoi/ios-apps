//
//  ContentView.swift
//  json-placeholder-app
//
//  Created by Denis Tsoi on 18/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var todoVM: TodoViewModel
  @State var todos: [Todo] = []
  
  init() {
    self.todoVM = TodoViewModel()
  }
  
  var body: some View {
    VStack {
      Button(action: {
        self.todoVM.fetchTodos()
      }) {
        Text("Fetch Todos")
      }
      List (self.todoVM.todos, id: \.id) { todo in
        Text("\(todo.title)")

      }.onAppear {
      
        
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
