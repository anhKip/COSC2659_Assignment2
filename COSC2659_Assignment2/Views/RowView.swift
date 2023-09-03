//
//  RowView.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 03/09/2023.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject
    private var selectedCell: SelectedCell
    @EnvironmentObject
    private var userAction: UserAction
    @EnvironmentObject
    private var workingGrid: GridValues
    
    let squareIndex: Int
    private let columns = [0, 1, 2]
    
    // --- COLOR ---
    private let backgroundColor = Color("dynamicGridWhite")
    private let selectedBackgroundColor = Color("dynamicGridSelection")
    
    // -------------------- VIEW ---------------------------------------
    var body: some View {
        GridRow {
            ForEach(columns, id: \.self) { columnIndex in
                Button(action: {
                    
                }) {
//                                renderCellText(columnIndex: columnIndex)
                }
                .border(Color.black, width: 1)
                .background(backgroundColorFor(columnIndex, selectedCell: self.selectedCell.coordinate))
            }
        }
    }
    // ----------------------------------------------------------------
    private func isSelected(columnIndex: Int) -> Bool {
        return selectedCell.coordinate?.r == SquareView.index &&
            selectedCell.coordinate?.c == columnIndex &&
            selectedCell.coordinate?.s == SquareView.squareIndex
    }
    
    func backgroundColorFor(_ columnIndex: Int, selectedCell: Coordinate?) -> Color {
        guard let selectedCell = selectedCell else {
            return backgroundColor
        }
        
        let isinSameSquare = squareIndex == selectedCell.s
        let isInSameColumn = coordinateAt(columnIndex, isInSameColumnAs: selectedCell)
        let isInSameRow = coordinateAt(columnIndex, isInSameRowAs: selectedCell)
        
        // exact same coordinate
        if selectedCell.r == index && selectedCell.c == columnIndex && selectedCell.s == squareIndex {
            return Color("dynamicBlueSelection")
        } else if isinSameSquare || isInSameColumn || isInSameRow {
            return selectedBackgroundColor
        } else {
            return backgroundColor
        }
    }
    
    private func coordinateAt(_ columnIndex: Int, isInSameColumnAs selectedCoordinate: Coordinate) -> Bool {
        let leftSquareIndices = [0, 3, 6]
        let midSquareIndices = [1, 4, 7]
        let rightSquareIndices = [2, 5, 8]

        var isInSameColumn = false

        if leftSquareIndices.contains(squareIndex) && leftSquareIndices.contains(selectedCoordinate.s) && columnIndex == selectedCoordinate.c ||
            midSquareIndices.contains(squareIndex) && midSquareIndices.contains(selectedCoordinate.s) && columnIndex == selectedCoordinate.c ||
            rightSquareIndices.contains(squareIndex) && rightSquareIndices.contains(selectedCoordinate.s) && columnIndex == selectedCoordinate.c {
            isInSameColumn = true
        }

        return isInSameColumn
    }
    
    private func coordinateAt(_ columnIndex: Int, isInSameRowAs selectedCoordinate: Coordinate) -> Bool {
        let topSquareRowIndices = [0, 1, 2]
        let midSquareRowIndices = [3, 4, 5]
        let bottomSquareRowIndices = [6, 7, 8]

        var isInSameRow = false

        if topSquareRowIndices.contains(squareIndex) && topSquareRowIndices.contains(selectedCoordinate.s) && index == selectedCoordinate.r ||
            midSquareRowIndices.contains(squareIndex) && midSquareRowIndices.contains(selectedCoordinate.s) && index == selectedCoordinate.r ||
            bottomSquareRowIndices.contains(squareIndex) && bottomSquareRowIndices.contains(selectedCoordinate.s) && index == selectedCoordinate.r {
            isInSameRow = true
        }

        return isInSameRow
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
            .environmentObject(SelectedCell())
    }
}
