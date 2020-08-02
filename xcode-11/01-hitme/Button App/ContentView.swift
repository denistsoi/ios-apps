//
//  ContentView.swift
//  Button App
//
//  Created by Denis Tsoi on 2/8/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false

    var body: some View {
        VStack {
            Text("Hello, World!")
            Button(action: {
                
                print("hello")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me"/*@END_MENU_TOKEN@*/)
            }.alert(isPresented: $alertIsVisible, content: {
                () -> Alert in return Alert(title: Text("Hello"), message: Text("Awesome"), dismissButton: .default(Text("Beep")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
