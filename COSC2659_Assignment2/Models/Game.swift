/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Minh Anh
    ID: S3931980
    Created date: 27/08/2023
    Last modified:
    Acknowledgement:
 */

import Foundation
import SwiftUI

class Game: Identifiable {
    var id = UUID()
//    var startTime: Timer
    
    @Published var puzzle: Puzzle
    @Published var solution: Puzzle
    var difficulty: Difficulty
    
    var errorCount: Int
    var hintCount: Int
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        self.puzzle = Puzzle(N: 9)
        self.solution = Puzzle(N: 9)
        
        // initialize game-related variable
        self.errorCount = 0
        self.hintCount = 0
        
//        self.startTime = Timer()

    }
    
    
    
}
