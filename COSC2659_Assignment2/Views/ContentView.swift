//
//  ContentView.swift
//  COSC2659_Assignment2
//
//  Created by Anh Tran Minh on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
        var puzzle = Game()
        for i in 0...9 {
            for j in 0...9{
                print(puzzle.puzzle[i][j], terminator: " ")
            }
            print()
        }
    }
    var body: some View {
        MenuView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
