//
//  RowView.swift
//  TaskList
//
//  Created by Denis Tsoi on 11/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

struct RowView: View {
  @Binding var task: Task
  var body: some View {
    NavigationLink(destination: TaskEditingView(task: $task)) {
      Text(task.name)
    }
  }
}

struct RowView_Previews: PreviewProvider {
  static var previews: some View {
    RowView(task: .constant(Task(name: "Todo")))
  }
}
