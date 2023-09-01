//
//  Game.swift
//  COSC2659_Assignment2
//
//  Created by Anh Tran Minh on 29/08/2023.
//

import Foundation
import SwiftUI

struct Game: Identifiable {
    var id = UUID()
//    var startTime: Timer
    
    @State var puzzle = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
    @State var solution = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
//    var errorCount: Int
//    var hintCount: Int
    
    var SRNd: Double
    var SRN: Int
    
    init() {
//        self.startTime = Timer()
        self.SRNd = sqrt(9)
        self.SRN = Int(SRNd)
        generatePuzzle()
        self.solution = self.puzzle
        removeDigits(numDigits: 20)
    }
    
    func generatePuzzle() {
        fillDiagonal()
        fillRemaining(row: 0, col: self.SRN)
    }
    
    /// Remove a number of digits from the puzzle
    /// - Parameters:
    ///     - numDigits: The number of digits to be removed
    func removeDigits(numDigits: Int) {
        var count = numDigits
        var i: Int, j: Int;
        
        while count != 0 {
            i = Int.random(in: 0...8)
            j = Int.random(in: 0...8)
            if self.puzzle[i][j] != 0 {
                count -= 1
                self.puzzle[i][j] = 0
            }
        }
    }
    
    func fillDiagonal() {
        //        ForEach(Array(stride(from: 0, to: 9, by: SRN)), id: \.self) { index in
        //            fillBox(row: index, col: index)
        //        }
        var i = 0
        while i < 9 {
            fillBox(row: i, col: i)
            i += self.SRN
        }
    }
    
    func fillBox(row: Int, col: Int) {
        var num = 0
        for i in 0...SRN {
            for j in 0...SRN {
                while true {
                    num = Int.random(in: 1...9)
                    if unUsedInBox(rowStart: row, colStart: col, num: num) {
                        break
                    }
                }
                self.puzzle[row+i][col+j] = num
            }
        }
    }
    
    func fillRemaining(row: Int, col: Int) -> Bool {
        var i = row
        var j = col
        
        // Check if we have reached the end of the matrix
        if i == 9 - 1 && j == 9 {
            return true
        }
        
        // Continue to next row if we have reached the end of current row
        if j == 9 {
            i += 1
            j = 0
        }
        
        // Skip cells that are already filled
        if self.puzzle[i][j] != 0 {
            return fillRemaining(row: i, col: j)
        }
        
        // Fill current cell with valid value
        for num in 1...(9+1) {
            if checkIfSafe(i: i, j: j, num: num) {
                self.puzzle[i][j] = num
                if fillRemaining(row: i, col: j+1) {
                    return true
                }
                self.puzzle[i][j] = 0
            }
        }
        // no valid value -> backtrack
        return false
    }
    
    func unUsedInBox(rowStart: Int, colStart: Int, num: Int) -> Bool {
        for i in 0...self.SRN {
            for j in 0...self.SRN {
                if self.puzzle[rowStart+i][colStart+j] == num {
                    return false
                }
            }
        }
        return true
    }
    
    func unUsedInRow(i: Int, num: Int)-> Bool {
        for j in 0...9 {
            if self.puzzle[i][j] == num {
                return false
            }
        }
        return true
    }
    
    func unUsedInCol (j: Int, num: Int) -> Bool {
        for i in 0...9 {
            if self.puzzle[i][j] == num {
                return false
            }
        }
        return true
    }
    
    func checkIfSafe(i: Int, j: Int, num: Int) -> Bool {
        return (unUsedInRow(i: i, num: num) &&
                unUsedInCol(j: j, num: num) &&
                unUsedInBox(rowStart: i - i % self.SRN, colStart: j - j % self.SRN, num: num))
    }
    
    
}
