/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Tran Minh Anh
 ID: S3931980
 Created date: 25/08/2023
 Last modified:
 Acknowledgement:
 */

import SwiftUI

struct MenuView: View {
    @State var isActive: Bool = false
    @EnvironmentObject var currentGame: Game
    @EnvironmentObject var highscores: HighscoreData
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: Screen.height/4)
                
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
                
//                if self.currentGame.getData() {
//                    Button {
//                        
//                    } label: {
//                        Text("Resume game")
//                            .font(MyFont.body)
//                    }
//                    .padding(.bottom, 10)
//                    .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
//                }
                
                NavigationLink(destination: DifficultyView(rootIsActive: self.$isActive).navigationBarBackButtonHidden(true), isActive: self.$isActive, label: {
                    Text("Start game")
                        .font(MyFont.body)
                })
                .isDetailLink(false)
                .padding(.bottom, 10)
                .buttonStyle(GradientStyle(colors: [Colors.secondary, Colors.primary, Colors.primary]))
                
                NavigationLink(destination: LeaderboardView().navigationBarBackButtonHidden(true).environmentObject(HighscoreData()), label: {
                    Text("Leaderboard")
                        .font(MyFont.body)
                })
                .isDetailLink(false)
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
            .environmentObject(Game(difficulty: .easy))
            .environmentObject(HighscoreData())

    }
}
