/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Minh Anh
    ID: S3931980
    Created date: 27/08/2023
    Last modified: 06/09/2023
    Acknowledgement:
    https://developer.apple.com/forums/thread/127572
    https://www.youtube.com/watch?v=-UUyo3bOlys

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
    /// Update player's grid
    /// - Parameter value: digit to be added to grid
    /// - Parameter coordinate: coordinate of the digit in the grid
    func updatePlayerGrid(value: Int, at coordinate: Coordinate) {
        // This is default digit
        if self.originalPuzzle.mat[coordinate.r][coordinate.c] != 0 {
            return
        } else {
            if self.solution.mat[coordinate.r][coordinate.c] == value {
                
            }
            self.puzzle.mat[coordinate.r][coordinate.c] = value
        }
    }
    
    func getData() -> Bool {
        var data : GameData = readJSON(from: "game")
        
        self.id = data.id
        self.puzzle.mat = data.puzzle
        self.solution.mat = data.solution
        self.originalPuzzle.mat = data.originalPuzzle
        self.difficulty = data.difficulty
        self.errorCount = data.errorCount
        self.hintCount = data.hintCount
        
        return true
    }
    
    func writeJSON(to filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("In Game.writeJSON: Failed to locate \(filename) in bundle.")
        }
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let gameData = GameData(id: self.id, puzzle: self.puzzle.mat, solution: self.solution.mat, originalPuzzle: self.originalPuzzle.mat, difficulty: self.difficulty, errorCount: self.errorCount, hintCount: self.hintCount)
            
            let jsonData = try encoder.encode(gameData)
            try jsonData.write(to: url)
        } catch {
            print("In writeJSON: \(error)")
        }
    }
    
    func readJSON<T: Decodable>(from filename: String) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("In Game.readJSON: Failed to locate \(filename) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("In Game.readJSON: Failed to load \(filename) from bundle.")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("In Game.readJSON: Failed to decode \(filename).")
        }
        print("In readJSON: \(loaded)")
        
        return loaded
    }
    
}
