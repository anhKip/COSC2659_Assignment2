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

struct GridView: View {
    @EnvironmentObject private var selectedCell : SelectedCell
    @EnvironmentObject private var userAction: UserAction
    @EnvironmentObject private var currentGame: Game
    
    static var spacerWidth: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 80
        } else {
            return 8
        }
    }
    
    private var borderWidth: CGFloat {
        Screen.height > 667 ? 3 : 2
    }
    
    private let squareRowRanges = [(0...2), (3...5), (6...8)]
    private let rowIndices = [0, 1, 2]
    private let columns = [0, 1, 2]
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Spacer()
                
                Grid(alignment: .leading, horizontalSpacing: -1, verticalSpacing: -1) {
                    ForEach(squareRowRanges, id: \.self) { squareRowRange in
                        GridRow {
                            ForEach(squareRowRange, id: \.self) { squareIndex in
                                Grid(alignment: .leading, horizontalSpacing: 0, verticalSpacing: 0) {
                                    ForEach(rowIndices, id: \.self) { rowIndex in
                                        GridRow {
                                            ForEach(columns, id: \.self) { columnIndex in
                                                Button {
                                                    updateSelectedCell(columnIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex)
                                                } label: {
                                                    renderCell(columnIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex)
                                                }
                                                .foregroundColor(getForegroundColor(columnIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex))
                                                .border(Colors.tertiary, width: 1)
                                                .background(getBackgroundColor(columnIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex))
                                                
                                            }
                                        }
                                        
                                    }
                                }
                                .border(Colors.tertiary, width: borderWidth)
                            }
                        }
                    }
                }
                .padding(borderWidth)
                .border(Colors.tertiary, width: borderWidth)
                
                Spacer()
            }
        }
    }
    
    /// Get value of cell from grid to be displayed
    private func renderCell(columnIndex: Int, rowIndex: Int, squareIndex: Int) -> AnyView {
        let coor = self.currentGame.puzzle.getCoor(colIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex)
        
        var value: String
        if currentGame.puzzle.mat[coor.r][coor.c] == 0 {
            value = " "
        } else {
            value = String(currentGame.puzzle.mat[coor.r][coor.c])
        }
        
        return AnyView(Text(value).font(MyFont.title).frame(maxWidth: .infinity, minHeight: (Screen.width - 2 * (GridView.spacerWidth))/9))
    }
    
    private func updateSelectedCell(columnIndex: Int, rowIndex: Int, squareIndex: Int) {
        if !(selectedCell.coordinate?.r == rowIndex && selectedCell.coordinate?.c == columnIndex && selectedCell.coordinate?.s == squareIndex) {
            selectedCell.coordinate = Coordinate(r: rowIndex, c: columnIndex, s: squareIndex)
        } else {
            selectedCell.coordinate = nil
        }
        userAction.action = .none
    }
    
    /// Get foreground color for each cell
    /// Return red if digit is incorrect
    /// Return secondary if it is a digit player input
    /// Return text color if it is a generated digit
    private func getForegroundColor(columnIndex: Int, rowIndex: Int, squareIndex: Int) -> Color {
        let coor = currentGame.puzzle.getCoor(colIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex)
        
        if currentGame.puzzle.mat[coor.r][coor.c] != currentGame.solution.mat[coor.r][coor.c] {
            return Color.red
        } else if currentGame.originalPuzzle.mat[coor.r][coor.c] == 0 {
            return Colors.secondary
        }
        return Colors.text
    }
    
    private func getBackgroundColor(columnIndex: Int, rowIndex: Int, squareIndex: Int) -> Color {
        guard let selectedCell = self.selectedCell.coordinate else {
            return Color.white
        }
        
        let coor = currentGame.puzzle.getCoor(colIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex)
        let selectedCoor = currentGame.puzzle.getCoor(colIndex: selectedCell.c, rowIndex: selectedCell.r, squareIndex: selectedCell.s)
        
        let inSameColumn = coor.c == selectedCoor.c
        let inSameRow = coor.r == selectedCoor.r
        let inSameSquare = coor.s == selectedCoor.s
        
        if selectedCoor.c == coor.c && selectedCoor.r == coor.r && selectedCoor.s == coor.s { // the selected cell
            return Colors.backgroundCellSelected
        } else if inSameColumn || inSameRow || inSameSquare {
            return Colors.backgroundSelected
        } else {
            return Color.white
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(Game(difficulty: .easy))
            .environmentObject(SelectedCell())
            .environmentObject(UserAction())
    }
}
