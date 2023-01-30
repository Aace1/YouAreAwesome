//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by TheForce on 1/24/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audoPlayer: AVAudioPlayer!
    
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
                let message = ["Imagine, Create, Design",
                               "Design is Everything",
                               "Engineering, Art and Creativity",
                               "Creativity is intelligence",
                               "Visualize and Create",
                               "Design Fuses Art With Engineering",
                               "Lines, Symmetry and Flow",
                               "Design Communicates the Experience"]
                
                var messageNumber = Int.random(in: 0...message.count-1)
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...message.count-1)
                }
                messageString = message[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                var soundNumber = Int.random(in: 0...7)
                while soundNumber == lastSoundNumber {
                    soundNumber = Int.random(in: 0...7)
                }
                soundName = "sound\(soundNumber)"
                lastSoundNumber = soundNumber
                
                guard let soundFile = NSDataAsset(name: soundName) else
                {
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                do {
                    audoPlayer = try AVAudioPlayer(data: soundFile.data)
                    audoPlayer.play()
                } catch {
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
                }
                
                
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
