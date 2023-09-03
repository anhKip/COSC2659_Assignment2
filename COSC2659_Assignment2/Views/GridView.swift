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
    // Game grids
    let grid: [[Int]]
    
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
                                                    
                                                } label: {
                                                    renderCell(columnIndex: columnIndex, rowIndex: rowIndex, squareIndex: squareIndex)
                                                }
                                                .foregroundColor(Colors.text)
                                                .border(Colors.tertiary, width: 1)
                                                
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
    
    private func renderCell(columnIndex: Int, rowIndex: Int, squareIndex: Int) -> AnyView {
        let coordinate = Coordinate(r: rowIndex, c: columnIndex, s: squareIndex)
        var col = columnIndex, row = rowIndex
        
        switch squareIndex {
        case 1:
            col += 3*1
            break
        case 2:
            col += 3*2
            break
        case 3:
            row += 3*1
            break
        case 4:
            col += 3*1
            row += 3*1
            break
        case 5:
            col += 3*2
            row += 3*1
            break
        case 6:
            row += 3*2
            break
        case 7:
            col += 3*2
            row += 3*1
            break
        case 8:
            col += 3*2
            row += 3*2
            break
        default:
            break
        }
        
        var value: String
        if grid[row][col] == 0 {
            value = " "
        } else {
            value = String(grid[row][col])
        }
        
        return AnyView(Text(value).font(MyFont.title).frame(maxWidth: .infinity, minHeight: (Screen.width - 2 * (GridView.spacerWidth))/9))
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(grid: [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9))
    }
}
