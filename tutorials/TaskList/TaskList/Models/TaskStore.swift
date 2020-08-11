//
//  TaskStore.swift
//  TaskList
//
//  Created by Denis Tsoi on 11/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Combine

class TaskStore: ObservableObject {
  @Published var tasks = [
    "Code a SwiftUI app",
    "Order Lunch"
  ].map{ Task(name: $0) }
}
