import SwiftUI

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
