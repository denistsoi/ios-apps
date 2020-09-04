import Foundation

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