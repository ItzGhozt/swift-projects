import SwiftUI
import AVFoundation

enum Move: String, CaseIterable {
    case rock = "🪨"
    case scissors = "✂️"
    case paper = "📝"
}

struct ContentView: View {
    // State variables for user choice, computer choice, and result message
    @State private var userChoice: Move = .rock
    @State private var computerChoice: Move = .rock
    @State private var result: String = ""
    @State private var wins: Int = 0
    @State private var losses: Int = 0
    @State private var ties: Int = 0
    @State private var animationAmount: CGFloat = 1.0
    @State private var playerOffset: CGSize = .zero
    @State private var cpuOffset: CGSize = .zero
    @State private var showExplosion: Bool = false

    var body: some View {
        VStack {
            // Title
            Text("Rock, Paper, Scissors!")
                .font(.largeTitle)
                .padding(.top, 20)

            Spacer()

            // Display result and CPU choice
            if !result.isEmpty {
                VStack {
                    Text("CPU Choice")
                        .font(.headline)
                        .padding(.bottom, 5)

                    Text(computerChoice.rawValue)
                        .font(.system(size: 80))
                        .offset(cpuOffset)
                        .animation(.easeInOut(duration: 0.5), value: cpuOffset)

                    if showExplosion {
                        Text("💥")
                            .font(.system(size: 80))
                            .transition(.scale)
                    }

                    Text(result)
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                }
                .padding()
            }

            Spacer()

            // User Choice Section
            VStack {
                Text("Your Choice")
                    .font(.headline)
                    .padding(.bottom, 5)

                Text(userChoice.rawValue)
                    .font(.system(size: 80))
                    .offset(playerOffset)
                    .animation(.easeInOut(duration: 0.5), value: playerOffset)
                    .padding()

                Picker("Select Emoji", selection: $userChoice) {
                    ForEach(Move.allCases, id: \ .self) { move in
                        Text(move.rawValue)
                            .font(.system(size: 40))
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }

            // Submit Button
            Button("Submit") {
                computerChoice = GameLogic.randomMove()
                result = GameLogic.determineWinner(player: userChoice, computer: computerChoice)
                triggerAnimations()
                updateCounters()
            }
            .padding()

            // Counter Section
            VStack {
                Text("Scores")
                    .font(.headline)
                    .padding(.bottom, 5)

                HStack {
                    VStack {
                        Text("Wins")
                        Text("\(wins)")
                            .font(.title2)
                    }
                    .padding()

                    VStack {
                        Text("Losses")
                        Text("\(losses)")
                            .font(.title2)
                    }
                    .padding()

                    VStack {
                        Text("Ties")
                        Text("\(ties)")
                            .font(.title2)
                    }
                    .padding()
                }
            }

            // Reset Button
            Button("Reset") {
                resetGame()
            }
            .foregroundColor(.red)
            .padding()
        }
    }

    private func triggerAnimations() {
        animationAmount = 1.5

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animationAmount = 1.0
        }

        if result == "You win!" {
            withAnimation(.easeInOut(duration: 0.5)) {
                playerOffset = CGSize(width: 0, height: -150)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showExplosion = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        playerOffset = .zero
                        showExplosion = false
                    }
                }
            }
        } else if result == "CPU wins!" {
            withAnimation(.easeInOut(duration: 0.5)) {
                cpuOffset = CGSize(width: 0, height: 150)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showExplosion = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        cpuOffset = .zero
                        showExplosion = false
                    }
                }
            }
        }
    }

    private func updateCounters() {
        switch result {
        case "You win!":
            wins += 1
        case "CPU wins!":
            losses += 1
        case "It's a tie!":
            ties += 1
        default:
            break
        }
    }

    private func resetGame() {
        userChoice = .rock
        computerChoice = .rock
        result = ""
        wins = 0
        losses = 0
        ties = 0
        animationAmount = 1.0
        playerOffset = .zero
        cpuOffset = .zero
        showExplosion = false
    }
}

#Preview {
    ContentView()
}
