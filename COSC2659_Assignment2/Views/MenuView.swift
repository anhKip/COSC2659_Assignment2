//
//  MenuView.swift
//  COSC2659_Assignment2
//
//  Created by Anh Tran Minh on 29/08/2023.
//

import SwiftUI

struct MenuView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
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
                    .foregroundColor(Colors.text)
                }
                .padding(.bottom, 50)
                
                //            Button {
                //
                //            } label: {
                //                Text("Resume game")
                //                    .font(MyFont.body)
                //            }
                //            .padding(.bottom, 10)
                //            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
                
                NavigationLink(destination: DifficultyView(rootIsActive: self.$isActive).navigationBarBackButtonHidden(true),             isActive: self.$isActive, label: {
                    Text("Start game")
                        .font(MyFont.body)
                })
                .isDetailLink(false)
                .padding(.bottom, 10)
                .buttonStyle(GradientStyle(colors: [Colors.secondary, Colors.primary, Colors.primary]))
                
                Button {
                    
                } label: {
                    Text("Leaderboard")
                        .font(MyFont.body)
                }
                .padding(.bottom, 10)
                .buttonStyle(GradientStyle(colors: [Colors.secondary, Colors.primary, Colors.primary]))
                
                Button {
                    
                } label: {
                    Text("Settings")
                        .font(MyFont.body)
                }
                .padding(.bottom, 10)
                .buttonStyle(GradientStyle(colors: [Colors.secondary, Colors.primary, Colors.primary]))
                
                Spacer()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
