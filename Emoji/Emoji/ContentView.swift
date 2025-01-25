import SwiftUI

enum Emojis: String, CaseIterable {
    case mad = "😡"
    case star = "🤩"
    case dead = "💀"
    case x = "❌"
}

struct ContentView: View {
    @State var emojiDisplay: Emojis = .mad
    
    var body: some View {
        NavigationView {
            VStack {
                Text(emojiDisplay.rawValue)
                    .font(.system(size: 80))
                
                Picker("Select Emoji", selection: $emojiDisplay) {
                    ForEach(Emojis.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }
            .navigationTitle("Emoji Picker")
        }
    }
}

#Preview {
    ContentView()
}
