//
//  Game.swift
//  COSC2659_Assignment2
//
//  Created by Anh Tran Minh on 29/08/2023.
// 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

import Foundation
import SwiftUI

class Game: Identifiable {
    var id = UUID()
//    var startTime: Timer
    
    var puzzle: Puzzle
    var solution: Puzzle
    
//    var errorCount: Int
//    var hintCount: Int
    
    init() {
//        self.startTime = Timer()
        self.solution = Puzzle(N: 9)
        self.puzzle = Puzzle(N: 9)
        self.puzzle.mat = self.solution.mat
        puzzle.removeDigits(numDigits: 40)
    }
    
    
    
}
