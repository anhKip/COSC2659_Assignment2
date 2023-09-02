//
//  MenuView.swift
//  COSC2659_Assignment2
//
//  Created by Anh Tran Minh on 29/08/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Resume game")
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Button {
                
            } label: {
                Text("Start game")
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Button {
                
            } label: {
                Text("Leaderboard")
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Button {
                
            } label: {
                Text("Settings")
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
