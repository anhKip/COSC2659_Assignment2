//
//  SudokuGrid.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 03/09/2023.
//

import SwiftUI

struct GridView: View {
    
    static var spacerWidth: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 80
        } else {
            return 8
        }
    }
    
    private var borderWidth: CGFloat {
        UIScreen.main.bounds.size.height > 667 ? 2 : 1
    }
    
    private let squareRowRanges = [(0...2), (3...5), (6...8)]
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: GridView.spacerWidth)
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                ForEach(squareRowRanges, id: \.self) { squareRowRange in
                    GridRow {
                        ForEach(squareRowRange, id: \.self) { squareIndex in
                            SquareView()
                        }
                    }
                }
            }
            .padding(borderWidth)
            .border(Color.black, width: borderWidth)
            Spacer()
                .frame(width: GridView.spacerWidth)
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
