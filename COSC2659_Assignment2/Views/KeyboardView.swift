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

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject private var userAction : UserAction
    @EnvironmentObject private var currentGame: Game
    @EnvironmentObject private var inputStatus: InputStatus
    
    let selectedCellCoor: Coordinate?
    private var borderWidth: CGFloat {
        Screen.height > 667 ? 3 : 2
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    self.editCell(digit: nil)
                } label: {
                    VStack {
                        Image(systemName: "eraser")
                            .font(.title)
                            .foregroundColor(Colors.primary)
                        Text("Erase")
                            .font(MyFont.body)
                            .foregroundColor(Colors.primary)
                    }
                }
                
                Spacer()
                    .frame(width: Screen.width/2)
                
                Button {
                    
                } label: {
                    VStack {
                        Image(systemName: "lightbulb")
                            .font(.title)
                            .foregroundColor(Colors.primary)
                        Text("Hint")
                            .font(MyFont.body)
                            .foregroundColor(Colors.primary)
                    }
                }
                Spacer()
            }
            
            HStack(spacing: -1) {
                ForEach((1...9), id: \.self) { digit in
                    Button {
                        self.editCell(digit: digit)
                    } label: {
                        Text("\(digit)")
                            .foregroundColor(Colors.text)
                            .font(MyFont.title)
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .border(Colors.tertiary, width: 1)
                    }
                }
            }
            .padding(borderWidth)
            .border(Colors.tertiary, width: borderWidth)
            .frame(maxWidth: .infinity)
        }

    }
    
    /// Input a guess or erase a cell
    /// - Parameter digit: an optional input guess
    func editCell (digit: Int?) {
        // Unwrap coordinate value
        guard let selectedCellCoor = self.selectedCellCoor else {
            return
        }
        
        // Get meaningful coordinate value
        let coor = currentGame.puzzle.getCoor(colIndex: selectedCellCoor.c, rowIndex: selectedCellCoor.r, squareIndex: selectedCellCoor.s) 
        
        // Erase
        guard let digit = digit else {
            self.userAction.action = .erase
            self.currentGame.updatePlayerGrid(value: 0, at: coor)
            self.inputStatus.wrongInput = false
            return
        }
        
        // Set cell to new digit
        self.userAction.action = .digit(digit)
        self.currentGame.updatePlayerGrid(value: digit, at: coor)
        
        // Verify guess
        if currentGame.solution.mat[coor.r][coor.c] != digit { // wrong input
            self.inputStatus.wrongInput = true
            self.currentGame.errorCount += 1
        } else {
            self.inputStatus.wrongInput = false
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(selectedCellCoor: nil)
            .environmentObject(UserAction())
            .environmentObject(Game(difficulty: .easy))
            .environmentObject(InputStatus())
    }
}