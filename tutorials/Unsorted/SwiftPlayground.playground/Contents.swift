


struct Animal {
  let name: String
  let sound: String
  
  // method
  func greeting() -> String {
    return "\(name) goes \(sound)"
  }
}

let cat = Animal(name: "bob", sound: "miao")
let dog = Animal(name: "beb", sound: "woof")
cat.greeting()
dog.greeting()


//
class Person {
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
}

let Rayman = Person(name: "Ray")
