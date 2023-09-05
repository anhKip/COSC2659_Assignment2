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
    https://developer.apple.com/forums/thread/127572
 */

import Foundation
import SwiftUI

class Game: Identifiable, ObservableObject{
    var id = UUID()
//    var startTime: Timer
    
    @Published var puzzle: Puzzle
    @Published var solution: Puzzle
    var originalPuzzle: Puzzle
    var difficulty: Difficulty
    
    var errorCount: Int
    var hintCount: Int
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        self.puzzle = Puzzle(N: 9)
        self.solution = Puzzle(N: 9)
        self.originalPuzzle = Puzzle(N: 9)
        
        // initialize game-related variable
        self.errorCount = 0
        self.hintCount = 0
        
//        self.startTime = Timer()

    }
    
    // ------------------------- HELPER ----------------------------
    func updatePlayerGrid(value: Int, at coordinate: Coordinate) {
        // This is default digit
        if self.originalPuzzle.mat[coordinate.r][coordinate.c] != 0 {
            print("In updatePlayerGrid, this is a default cell")
            return
        } else {
            if self.solution.mat[coordinate.r][coordinate.c] == value {
                
            }
            self.puzzle.mat[coordinate.r][coordinate.c] = value
            print("In updatePlayerGrid, value has been changed to \(value) at cell [\(coordinate.r), \(coordinate.c)]")
        }
    }
    
}
