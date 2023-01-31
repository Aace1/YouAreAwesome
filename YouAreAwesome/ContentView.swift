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
                
                var messageNumber: Int
//                repeat {
//                    messageNumber = Int.random(in: 0...message.count-1)
//                } while messageNumber == lastMessageNumber
                messageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: message.count-1)
                messageString = message[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...7)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                
                playSound(soundName: "sound\(soundNumber)")
                
            }
            .buttonStyle(.borderedProminent)
            
            .padding()
        }
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
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
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var number: Int
        repeat {
            number = Int.random(in: 0...upperBounds)
        } while number == lastNumber
        return number
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
