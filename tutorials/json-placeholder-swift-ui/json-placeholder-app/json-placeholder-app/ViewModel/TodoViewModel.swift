//
//  TodoViewModel.swift
//  json-placeholder-app
//
//  Created by Denis Tsoi on 19/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Foundation
import Combine

class TodoViewModel: ObservableObject {
  private var todoService: TodoService!
  
  @Published var todos = [Todo]()
  
  init() {
    self.todoService = TodoService()
  }
  
  func fetchTodos() {
    self.todoService.getTodos() { todos in
      
      DispatchQueue.main.async {
        self.todos = todos
      }
      
    }
  }
}
