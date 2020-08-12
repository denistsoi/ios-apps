//
//  TaskStore.swift
//  TaskList
//
//  Created by Denis Tsoi on 11/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Combine

class TaskStore: ObservableObject {
  @Published var prioritizedTasks = [
    PrioritizedTasks(
      priority: .high,
      names: [
        "Code a SwiftUI app",
        "Order Lunch"
      ]
    ),
    PrioritizedTasks(
      priority: .medium,
      names: [
        "Bake a cake",
        "Sleep"
      ]
    ),
    PrioritizedTasks(
      priority: .low,
      names: [
        "Shower",
      ]
    ),
    PrioritizedTasks(
      priority: .no,
      names: [
        "Climb",
      ]
    ),
  ]
  
  func getIndex(for priority: Task.Priority) -> Int {
    prioritizedTasks.firstIndex { $0.priority == priority }!
  }
}

private extension TaskStore.PrioritizedTasks {
  init(priority: Task.Priority, names: [String]) {
    self.init(
      priority: priority,
      tasks: names.map { Task(name: $0) }
    )
  }
}
