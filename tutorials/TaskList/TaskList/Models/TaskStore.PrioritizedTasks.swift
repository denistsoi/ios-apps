//
//  TaskStore.PrioritizedTasks.swift
//  TaskList
//
//  Created by Denis Tsoi on 12/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

extension TaskStore {
  struct PrioritizedTasks {
    let priority: Task.Priority
    
    var tasks: [Task]
  }
}

extension TaskStore.PrioritizedTasks: Identifiable {
  var id: Task.Priority { priority }
}
