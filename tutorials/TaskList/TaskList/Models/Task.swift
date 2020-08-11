//
//  Task.swift
//  TaskList
//
//  Created by Denis Tsoi on 11/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Foundation

struct Task: Identifiable {
  let id = UUID()
  
  var name: String
  var completed: Bool = false
}
