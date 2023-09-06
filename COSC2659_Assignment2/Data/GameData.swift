/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Minh Anh
    ID: S3931980
    Created date: 04/09/2023
    Last modified:
    Acknowledgement:
    https://dev.to/arnavmotwani/handling-persistent-data-in-swiftui-2-0-with-json-1h7
 */


import Foundation

struct GameData: Hashable, Codable, Identifiable {
    var id: UUID
    
    var puzzle: [[Int]]
    var solution: [[Int]]
    var originalPuzzle: [[Int]]
    
    var difficulty: Difficulty
    var errorCount: Int
    var hintCount: Int
}
