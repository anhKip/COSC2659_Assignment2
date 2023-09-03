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
    https://github.com/rckim77/Sudoku
 */

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var shouldPopToRootView: Bool
    
    let currentGame: Game
    
    init(shouldPopToRootView: Binding<Bool>, currentGame: Game) {
        self._shouldPopToRootView = shouldPopToRootView
        self.currentGame = currentGame
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // ------------------ TOP BAR ------------------------
            HStack {
                Button {
                    self.shouldPopToRootView = false
                } label: {
                    Label("Back", systemImage: "chevron.backward")
                        .font(MyFont.body)
                }
                .padding(.horizontal, 15)
                .foregroundColor(Colors.primary)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 22))
                }
                .padding(.horizontal, 15)
                .foregroundColor(Colors.primary)
            }
            .padding(.bottom, 10)
            
            // ------------------ SUDOKU  ------------------------
            GridView(grid: currentGame.puzzle.mat)
            
            Spacer()
        }
        .onAppear {
            currentGame.puzzle.generateMat()
            currentGame.solution.mat = currentGame.puzzle.mat
            currentGame.puzzle.removeDigits(difficulty: currentGame.difficulty)
            
            for i in 0..<9 {
                for j in 0..<9 {
                    print(currentGame.puzzle.mat[i][j], terminator: " ")
                }
                print()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var shouldPop = false
    
    static var previews: some View {
        GameView(shouldPopToRootView: $shouldPop, currentGame: Game(difficulty: .easy))
    }
}
