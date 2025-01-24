//
//  ContentView.swift
//  rock-paper-scissors-starter
//
//  Created by Nicole on 1/24/25.
//

import SwiftUI

enum Move: String, CaseIterable {
    case rock = "🪨"
    // TODO: Add the rest of the cases for Rock, Paper, Scissors
    
}

struct ContentView: View {
    // State variables for user choice, computer choice, and result message
    @State private var userChoice: Move = .rock
    @State private var computerChoice: Move = .rock
    @State private var result: String = ""
    
    var body: some View {

        VStack{
            VStack {
                // Title
                Text("Rock, Paper, Scissors!")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Spacer() // Pushes everything upward
            }
            
            VStack{
                // TODO: Display the results after the user presses Submit.
                if !result.isEmpty {
                    VStack {
                        Text("CPU Choice")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        // Hint: Show computerChoice.rawValue (emoji) here.
                        Text("TODO: CPU's emoji")
                            .font(.system(size: 80))
                        
                        Text("TODO: Game result message")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding()
                    }.padding()
                }
                
            }
            Spacer()
        }
        
        VStack{
            
            // User Choice Section
            VStack {
                Text("Your Choice")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text(userChoice.rawValue)
                    .font(.system(size: 80))
                    .padding()
            }
            
        
            // Picker for selecting the user's move
            Picker("Select Emoji", selection: $userChoice) {
                ForEach(Move.allCases, id: \.self) { move in
                    Text(move.rawValue)
                        .font(.system(size: 40)) // Display the emoji in picker
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
        
        // Submit Button
        Button("Submit") {
            // TODO: Add logic to:
            // 1. Randomize a computer move (Hint: Use GameLogic.randomMove()).
            // 2. Compare userChoice and computerChoice (Hint: Use GameLogic.determineWinner()).
            // 3. Update the result variable with the winner message.
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
