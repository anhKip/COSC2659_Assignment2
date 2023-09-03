//
//  Constant.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 03/09/2023.
//

import Foundation
import SwiftUI

enum Screen {
    static let size = UIScreen.main.bounds
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

enum Colors {
    static let primary : Color = .indigo
    static let secondary: Color = .teal
    static let tertiary: Color = Color(red: 130/225, green: 130/225, blue: 192/225)
    static let text: Color = Color(red: 75/225, green: 60/225, blue: 84/225)
}
