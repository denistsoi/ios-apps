import Foundation
import Combine

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