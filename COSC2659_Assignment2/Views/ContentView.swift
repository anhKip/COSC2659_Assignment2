//
//  ContentView.swift
//  COSC2659_Assignment2
//
//  Created by Anh Tran Minh on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        MenuView()
            .onAppear(perform: {
                var game = Game()
                for i in 0..<9 {
                    for j in 0..<9 {
                        print(game.puzzle.mat[i][j], terminator: " ")
                    }
                    print()
                }
                print()
                for i in 0..<9 {
                    for j in 0..<9 {
                        print(game.solution.mat[i][j], terminator: " ")
                    }
                    print()
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
