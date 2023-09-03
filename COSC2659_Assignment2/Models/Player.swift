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

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var currentGame: Game?
    
}
