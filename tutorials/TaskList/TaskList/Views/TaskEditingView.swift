//
//  TaskEditingView.swift
//  TaskList
//
//  Created by Denis Tsoi on 11/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

struct TaskEditingView: View {
  @Binding var task: Task

  var body: some View {
    Form {
      TextField("Name", text: $task.name)
    }
  }
}

struct TaskEditingView_Previews: PreviewProvider {
    static var previews: some View {
      TaskEditingView(task: .constant(Task(name: "Todo")))
    }
}
