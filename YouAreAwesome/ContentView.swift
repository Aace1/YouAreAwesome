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
    @State private var imageNumber = 0
    
    var body: some View {
        
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
            
            Spacer()
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Spacer()
            
            
            Button("Show Message") {
                let message = ["Imagine, Create, Design!",
                               "Design is Everything!",
                               "Engineering, Art and Creativity!",
                               "Creativity is intelligence!",
                               "Visualize and Create"]
                
                
                messageString = message[Int.random(in: 0...(message.count - 1))]
                
                imageName = "image\(Int.random(in: 0...9))"
                print(imageName)
                
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
