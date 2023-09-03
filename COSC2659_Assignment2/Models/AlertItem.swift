/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Minh Anh
    ID: S3931980
    Created date: 31/08/2023
    Last modified:
    Acknowledgement:
    https://github.com/rckim77/Sudoku
 */

import Foundation

struct AlertItem: Identifiable {
    let id: AlertItemType
    
    enum AlertItemType {
        case finished, finishedIncorrectly
    }
}
