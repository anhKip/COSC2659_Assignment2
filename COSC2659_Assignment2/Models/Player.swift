//
//  Player.swift
//  COSC2659_Assignment2
//
//  Created by Anh Tran Minh on 29/08/2023.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var currentGame: Game?
    
}
