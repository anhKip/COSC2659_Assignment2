//
//  DifficultyView.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 03/09/2023.
//

import SwiftUI

struct DifficultyView: View {
    @Binding var rootIsActive : Bool
    
    var body: some View {
        VStack {
            NavigationLink(destination: GameView(shouldPopToRootView: self.$rootIsActive, currentGame: Game(difficulty: .easy))
                .navigationBarBackButtonHidden(true), label: {
                Text("Easy")
            })
            .isDetailLink(false)
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            NavigationLink(destination: GameView(shouldPopToRootView: self.$rootIsActive, currentGame: Game(difficulty: .medium)).navigationBarBackButtonHidden(true)) {
                Text("Medium")
            }
            .isDetailLink(false)
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            NavigationLink(destination: GameView(shouldPopToRootView: self.$rootIsActive, currentGame: Game(difficulty: .hard)).navigationBarBackButtonHidden(true)) {
                Text("Hard")
            }
            .isDetailLink(false)
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    @State static var isActive = true
    
    static var previews: some View {
        DifficultyView(rootIsActive: $isActive)
    }
}
