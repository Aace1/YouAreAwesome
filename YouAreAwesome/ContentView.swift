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
                let message1 = "You Are Great!"
                let message2 = "You Are Awesome!"
                let imageA = "image0"
                let imageB = "image2"
                
                messageString = (messageString == message1 ? message2 : message1)
                imageName = (imageName == imageA ? imageB : imageA)
                
//                if messageString == message1 {
//                    messageString = message2
//                    imageName = imageB
//                } else {
//                    messageString = message1
//                    imageName = imageA
//                }
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
