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
 https://developer.apple.com/forums/thread/701623
 https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-environmentobject-property-wrapper
 https://github.com/rckim77/Sudoku
 */

import SwiftUI

struct GameView: View {
    @Binding var shouldPopToRootView: Bool
    @EnvironmentObject private var selectedCell : SelectedCell
    @EnvironmentObject private var userAction: UserAction
    @EnvironmentObject private var currentGame: Game
    @State private var alertItem: AlertItem?
    
    init(shouldPopToRootView: Binding<Bool>) {
        self._shouldPopToRootView = shouldPopToRootView
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
            .padding(.bottom, 20)
            
            // ------------------ SUDOKU  ------------------------
            VStack {
                GridView()
                    .padding(.bottom, 20)
                
                Spacer()
                
                KeyboardView(alert: $alertItem, selectedCellCoor: selectedCell.coordinate)
                    .padding(.horizontal, 15)
                Spacer()
            }
            .alert(item: $alertItem, content: { item in
                switch item.id {
                case .finished:
                    return Alert(title: Text("Congratulations!"),
                                 message: Text("You've completed the puzzle!"),
                                 dismissButton: .default(Text("Go back"), action: {
                        self.shouldPopToRootView = false
                    }))
                case .finishedIncorrectly:
                    return Alert(title: Text("Almost!"),
                                 message: Text("Sorry but that's not quite right."),
                                 dismissButton: .default(Text("Dismiss")))
                }
            })
        }
        .onAppear {
            self.currentGame.puzzle.generateMat()
            self.currentGame.solution.mat = currentGame.puzzle.mat
            self.currentGame.puzzle.removeDigits(difficulty: currentGame.difficulty)
            self.currentGame.originalPuzzle.mat = currentGame.puzzle.mat
            
            for i in 0..<9 {
                for j in 0..<9 {
                    print(currentGame.puzzle.mat[i][j], terminator: " ")
                }
                print()
            }
        }
        .onDisappear {
            self.resetGrid()
        }
    }
    
    private func resetGrid() {
        self.selectedCell.coordinate = nil
        self.userAction.action = .none
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var shouldPop = false
    
    static var previews: some View {
        GameView(shouldPopToRootView: $shouldPop)
            .environmentObject(Game(difficulty: .easy))
            .environmentObject(SelectedCell())
            .environmentObject(UserAction())
    }
}
