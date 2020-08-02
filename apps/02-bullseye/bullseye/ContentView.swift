//
//  ContentView.swift
//  bullseye
//
//  Created by Denis Tsoi on 2/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

func calculateDifference(targetValue: Int, sliderValue: Int) -> Int {
  return sliderValue - targetValue
}

func setRandom() -> Int { Int.random(in: 1...100) }

struct ContentView: View {
  
  @State var isVisible = false
  @State var sliderValue = 50.0
  @State var targetValue = setRandom()
  @State var score = 0
  @State var roundNumber = 1
  
  func startOver() -> Void {
    sliderValue = 50.0
    targetValue = setRandom()
    score = 0
    roundNumber = 1
  }
  
  func sliderValueRounded() -> Int { Int(sliderValue.rounded()) }
  
  func calculatePoints() -> Int {
    let maximumBaseScore = 100
    let difference = calculateDifference(targetValue: targetValue, sliderValue: sliderValueRounded())
    
    
    let bonus: Int
    
    if abs(difference) == 0 {
      bonus = 100
    } else if abs(difference) == 1 {
      bonus = 50
    } else {
      bonus = 0
    }
    
    return maximumBaseScore - abs(difference) + bonus
    
  }
  
  func feedbackTitle () -> String {
    let difference = abs(calculateDifference(targetValue: targetValue, sliderValue: sliderValueRounded()))
    
    if difference == 0 {
      return "Perfect!"
    } else if difference < 5 {
      return "Almost!..."
    } else if difference < 10 {
      return "Not Quite"
    }
    
    return "Keey trying!!!"
  }
  
  var body: some View {
    VStack {
      Spacer()
      HStack {
        Text("Bullseye!")
        Text("\(targetValue)")
      }.padding(.horizontal, 20)
      Spacer()
      HStack {
        Text("1")
        Slider(value: self.$sliderValue, in: 1...100)
        Text("100")
      }.padding(.horizontal, 20)
      Spacer()
      HStack {
        Button(action: {
          self.isVisible = true
        }) {
          Text("Hit Me")
        }.alert(isPresented: $isVisible, content: {
          () -> Alert in
          let difference = calculateDifference(targetValue: targetValue, sliderValue: sliderValueRounded())
          
          let message = "Slider Value: \(sliderValueRounded()) \n" +
            "The difference is \(difference) \n" +
            "You scored \(calculatePoints()) this round."
          
          return Alert(
            title: Text(feedbackTitle()),
            message: Text(message),
            dismissButton: .default(Text("Dismiss")) {
              self.score = self.score + self.calculatePoints()
              self.targetValue = setRandom()
              self.roundNumber += 1
            }
          )
        })
      }
      Spacer()

      HStack {
        Button(action: {
          self.startOver()
        }) {
          Text("Start Over")
        }
        Spacer()
        Text("Score")
        Text("\(score)")
        Spacer()
        Text("Round")
        Text("\(roundNumber)")
        Spacer()
        //        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
        //          Text("Info")
        //        }
      }.padding(.horizontal, 20)
      Spacer()
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 892, height: 414))
  }
}
