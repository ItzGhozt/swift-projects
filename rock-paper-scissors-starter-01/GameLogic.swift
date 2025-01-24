////
//  GameLogic.swift
//  rock-paper-scissors
//
//  Created by Nicole Contreras on 1/22/25.
//

import Foundation

// Handles the game logic for Rock, Paper, Scissors
class GameLogic {
    static func determineWinner(player: Move, computer: Move) -> String {
        // TODO: Compare player and computer choices using if-else statements.
        // Hint: Start by checking if player == computer for a tie.
        return "Result of the game (Win/Loss/Tie)"
    }

    static func randomMove() -> Move {
        return Move.allCases.randomElement() ?? .rock
    }
}
