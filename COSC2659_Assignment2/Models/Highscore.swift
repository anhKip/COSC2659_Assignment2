//
//  Highscore.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 06/09/2023.
//

import Foundation

struct Highscore : Hashable, Codable {
    var name: String
    var score: Int
}
