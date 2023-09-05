//
//  UserAction.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 04/09/2023.
//

import Foundation

class UserAction : ObservableObject {
    enum ActionType {
        case none
        case erase
        case digit(_ digit: Int)
    }
    
    @Published var action: ActionType = .none
}
