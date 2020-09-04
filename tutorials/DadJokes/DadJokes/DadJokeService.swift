import Foundation

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

