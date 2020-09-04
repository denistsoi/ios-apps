//
//  ContentView.swift
//  new
//
//  Created by Denis Tsoi on 30/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct Joke: Decodable, Hashable {
  var title: String
  var selftext: String
}

struct JokeResponse: Decodable {
  struct Data: Decodable {
    struct Children: Decodable {
      var data: Joke
    }
    var dist: Int
    var children: [Children]
  }
  
  var kind: String
  var data: Data
}

class JokeService {
  func getJokes (completion: @escaping (JokeResponse) -> ()) {
    
    print("get jokes")
    
    guard let url = URL(string: "https://reddit.com/r/dadjokes.json") else {
      return
    }
    
    URLSession.shared.dataTask(with: url) {
      data, response, error in
      
      guard let data = data, error == nil else {
        return
      }
      
      let jokeResponse = try? JSONDecoder().decode(JokeResponse.self, from: data)

      if let jokeResponse = jokeResponse {
        print(jokeResponse)
        completion(jokeResponse)
      } else {
        return
      }
    }.resume()
  }
}



class VM: ObservableObject {
  private var jokeService: JokeService!

  @Published var jokes = [Joke]()

  init() {
    self.jokeService = JokeService()
  }

  func getJokes() {
    self.jokeService.getJokes() { jokeResponse in
      print(jokeResponse)
      DispatchQueue.main.async {
        self.jokes = jokeResponse.data.children.map {
          joke in
          
          Joke(
            title: joke.data.title,
            selftext: joke.data.selftext
          )
        }
      }
    }
  }
}

struct ContentView: View {
  @ObservedObject var vm: VM
  @State var jokes: [Joke] = []
  
  init() {
    self.vm = VM()
  }
  
  var body: some View {
    VStack {
      Spacer()
      
      Text("Jokes")
        .font(.title)
      
      List {
        ForEach(self.vm.jokes, id: \.self) {
          joke in
          
          VStack(alignment: .leading) {
            Text("\(joke.title)")
              .font(.headline)
          
            Text("\(joke.selftext)")
              .font(.caption)
          }

        }
      }.onAppear {
        self.vm.getJokes()
      }
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
