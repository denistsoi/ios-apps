//
//  PlaceholderService.swift
//  json-placeholder-app
//
//  Created by Denis Tsoi on 18/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Foundation

class TodoService {

  func getTodos(completion: @escaping ([Todo]) -> ()) {

    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      guard let data = data, error == nil else {
        return
      }
      
      let todoResponse = try? JSONDecoder().decode([Todo].self, from: data)
      if let todoResponse = todoResponse {
        completion(todoResponse)
      } else {
        return
      }
      
    }.resume()
    
  }
  
}
