//
//  Placeholder.swift
//  json-placeholder-app
//
//  Created by Denis Tsoi on 18/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Foundation

struct TodosList: Decodable {
  var todos: [Todo]
}

struct Todo: Decodable {
  var userId: Int
  var id: Int
  var title: String
  var completed: Bool
}
