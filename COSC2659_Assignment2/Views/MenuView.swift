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
            Spacer()
            
            HStack {
                Image(systemName: "grid")
                    .foregroundStyle(Gradient(colors: [.teal, .indigo]))
                    .font(.system(size: 45).weight(.bold))
                    
                VStack (alignment: .leading) {
                    Text("Simple")
                        .font(MyFont.title)
                    
                    Text("Sudoku")
                        .font(MyFont.title)
                }
            }
            .padding(.bottom, 50)
            Button {
                
            } label: {
                Text("Resume game")
                    .font(MyFont.body)
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Button {
                
            } label: {
                Text("Start game")
                    .font(MyFont.body)
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Button {
                
            } label: {
                Text("Leaderboard")
                    .font(MyFont.body)
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Button {
                
            } label: {
                Text("Settings")
                    .font(MyFont.body)
            }
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Spacer()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
