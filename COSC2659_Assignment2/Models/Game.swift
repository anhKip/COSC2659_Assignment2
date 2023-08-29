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
    var startTime: Clock
    
    @State var puzzle = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
    @State var solution = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
    var errorCount: Int
    var hintCount: Int
    
    var SRNd: Double
    var SRN: Int
    
    init() {
        self.startTime = Date()
        self.SRNd = sqrt(9)
        self.SRN = Int(SRNd)
        generatePuzzle()
    }
    
    func generatePuzzle() {
        
        fillDiagonal()
        fillRemaining(i: 0, j: SRN)
    }
    
    func fillDiagonal() {
//        ForEach(Array(stride(from: 0, to: 9, by: SRN)), id: \.self) { index in
//            fillBox(row: index, col: index)
//        }
        var i = 0
        while i < 9 {
            fillBox(row: i, col: i)
            i += SRN
        }
    }
    
    func unUsedInBox(rowStart: Int, colStart: Int, num: Int) -> Bool {
        for i in 0...SRN {
            for j in 0...SRN {
                if puzzle[rowStart+i][colStart+j] == num {
                    return false
                }
            }
        }
        return true
    }
    
    func checkIfSafe(i: Int, j: Int, num: Int) -> Bool {
        return (unUsedInRow(i, num) &&)
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
                puzzle[row+i][col+j] = num
            }
        }
    }
    
    func fillRemaining(i: Int, j: Int) -> Bool {
        // Check if we have reached the end of the matrix
        if i == 9 - 1 && j == 9 {
            return true
        }
        
        // Continue to next row if we have reached the end of current row
        if j == 9 {
            i++
            j = 0
        }
        
        // Skip cell that are already filled
        if puzzle[i][j] != 0 {
            return fillRemaining(i: i, j: j+1)
        }
        
        // Fill current cell
        for num in 1...(9+1) {
            if checkIfSafe(i, j+1)
        }
    }
}
