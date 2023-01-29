//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by TheForce on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
    var body: some View {
        
        VStack {
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
            
            Spacer()
            
            Button("Show Message") {
                let message = ["Imagine, Create, Design!",
                               "Design is Everything!",
                               "Engineering, Art and Creativity!",
                               "Creativity is intelligence!",
                               "Visualize and Create",
                               "Design Fuses Art With Engineering"]
                
                var messageNumber = Int.random(in: 0...message.count-1)
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...message.count-1)
                }
                messageString = message[messageNumber]
                lastMessageNumber = messageNumber
                
                //                imageName = "image\(Int.random(in: 0...9))"
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            .buttonStyle(.borderedProminent)
            
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
