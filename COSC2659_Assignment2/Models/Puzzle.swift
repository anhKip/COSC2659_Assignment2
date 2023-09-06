/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Minh Anh
    ID: S3931980
    Created date: 29/08/2023
    Last modified:
    Acknowledgement:
    https://www.geeksforgeeks.org/program-sudoku-generator/
 */

import Foundation
import SwiftUI

class Puzzle: Identifiable {
    var id = UUID()
    private var SRNd: Double
    private var SRN: Int
    var N: Int
    var mat: [[Int]]
    
    init(N: Int) {
        self.SRNd = sqrt(Double(N))
        self.SRN = Int(SRNd)
        self.N = N
        self.mat = [[Int]] (repeating: [Int](repeating: 0, count: N), count: N)
    }
    
    // ------------------------- HELPER ----------------------------
    func getCoor(colIndex: Int, rowIndex: Int, squareIndex: Int) -> Coordinate {
        var row = rowIndex, col = colIndex
        
        switch squareIndex {
        case 1:
            col += 3*1
            break
        case 2:
            col += 3*2
            break
        case 3:
            row += 3*1
            break
        case 4:
            col += 3*1
            row += 3*1
            break
        case 5:
            col += 3*2
            row += 3*1
            break
        case 6:
            row += 3*2
            break
        case 7:
            col += 3*1
            row += 3*2
            break
        case 8:
            col += 3*2
            row += 3*2
            break
        default:
            break
        }
        
        return Coordinate(r: row, c: col, s: squareIndex)
    }
    
    // ------------------------- GENERATING ----------------------------
    func generateMat() {
        fillDiagonal()
        fillRemaining(row: 0, col: self.SRN)
    }
    
    /// Remove a number of digits from the mat
    /// - Parameters:
    ///     - numDigits: The number of digits to be removed
    func removeDigits(difficulty: Difficulty) {
        var numDigits: Int
        switch(difficulty) {
        case .easy:
            numDigits = Int.random(in: 35...45)
            break
        case .medium:
            numDigits = Int.random(in: 45...55)
            break
        case .hard:
            numDigits = Int.random(in: 55...65)
            break
        }
        
        var count = numDigits
        var i: Int, j: Int;
        
        while count != 0 {
            i = Int.random(in: 0...8)
            j = Int.random(in: 0...8)
            if self.mat[i][j] != 0 {
                count -= 1
                self.mat[i][j] = 0
            }
        }
    }
    
    private func fillDiagonal() {
        var i = 0
        while i < self.N {
            fillBox(row: i, col: i)
            i += self.SRN
        }
    }
    
    private func fillBox(row: Int, col: Int) {
        var num = 0
        for i in 0..<SRN {
            for j in 0..<SRN {
                while true {
                    num = Int.random(in: 1...self.N)
                    if unUsedInBox(rowStart: row, colStart: col, num: num) {
                        break
                    }
                }
                self.mat[row+i][col+j] = num
            }
        }
    }
    
    @discardableResult private func fillRemaining(row: Int, col: Int) -> Bool {
        var i = row
        var j = col
        
        // Check if we have reached the end of the matrix
        if i == self.N-1 && j == self.N {
            return true
        }
        
        // Continue to next row if we have reached the end of current row
        if j == self.N {
            i += 1
            j = 0
        }
        
        // Skip cells that are already filled
        if self.mat[i][j] != 0 {
            return fillRemaining(row: i, col: j+1)
        }
        
        // Fill current cell with valid value
        for num in 1...self.N {
            if checkIfSafe(i: i, j: j, num: num) {
                self.mat[i][j] = num
                if fillRemaining(row: i, col: j+1) {
                    return true
                }
                self.mat[i][j] = 0
            }
        }
        // no valid value -> backtrack
        return false
    }
    
    private func unUsedInBox(rowStart: Int, colStart: Int, num: Int) -> Bool {
        for i in 0..<self.SRN {
            for j in 0..<self.SRN {
                if self.mat[rowStart+i][colStart+j] == num {
                    return false
                }
            }
        }
        return true
    }
    
    private func unUsedInRow(i: Int, num: Int)-> Bool {
        for j in 0..<self.N {
            if self.mat[i][j] == num {
                return false
            }
        }
        return true
    }
    
    private func unUsedInCol (j: Int, num: Int) -> Bool {
        for i in 0..<self.N {
            if self.mat[i][j] == num {
                return false
            }
        }
        return true
    }
    
    private func checkIfSafe(i: Int, j: Int, num: Int) -> Bool {
        return (unUsedInRow(i: i, num: num) &&
                unUsedInCol(j: j, num: num) &&
                unUsedInBox(rowStart: i - i % self.SRN, colStart: j - j % self.SRN, num: num))
    }
    
}

