//
//  SquareView.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 03/09/2023.
//

import SwiftUI

struct SquareView: View {
    let index: Int
    private let rowIndices = [0, 1, 2]
    private var borderWidth: CGFloat {
        UIScreen.main.bounds.size.height > 667 ? 2 : 1
    }
    
    // -------------------- VIEW ---------------------------------------
    var body: some View {
        Grid (alignment: .leading, horizontalSpacing: 0, verticalSpacing: 0){
            GridRow {
                ForEach(rowIndices, id: \.self) { rowIndex in
                    RowView(view: RowView(index: rowIndex,
                                                squareIndex: self.index,
                                                guesses: self.editGridSlice.filter { $0.r == rowIndex }))
                }
            }
        }
    }
    
    // ----------------------------------------------------------------
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView()
            
    }
}
