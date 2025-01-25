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
           if player == computer {
               return "It's a tie!"
           } else if (player == .rock && computer == .scissors) ||
                     (player == .paper && computer == .rock) ||
                     (player == .scissors && computer == .paper) {
               return "You win!"
           } else {
               return "CPU wins!"
           }
       }

       static func randomMove() -> Move {
           return Move.allCases.randomElement() ?? .rock
       }
   }
