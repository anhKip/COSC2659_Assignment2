//
//  mat.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 01/09/2023.
//

import Foundation
import SwiftUI

class Puzzle: Identifiable {
    var id = UUID()
    private var SRNd: Double
    private var SRN: Int
    var N: Int
    var mat = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
    
    init(N: Int) {
        self.SRNd = sqrt(Double(N))
        self.SRN = Int(SRNd)
        self.N = N
                
        generateMat()
    }
    
    private func generateMat() {
        fillDiagonal()
        fillRemaining(row: 0, col: self.SRN)
    }
    
    /// Remove a number of digits from the mat
    /// - Parameters:
    ///     - numDigits: The number of digits to be removed
    func removeDigits(numDigits: Int) {
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
    
    private func fillRemaining(row: Int, col: Int) -> Bool {
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

