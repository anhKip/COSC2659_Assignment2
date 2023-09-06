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
 */

import SwiftUI

struct DifficultyView: View {
    @Binding var rootIsActive : Bool
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    rootIsActive.toggle()
                } label: {
                    Label("Back", systemImage: "chevron.backward")
                        .font(MyFont.body)
                }
                .padding(.horizontal, 15)
                .foregroundColor(Colors.primary)
                
                Spacer()
            }
            .padding(.bottom, 20)
            
            Spacer()
            
            NavigationLink(destination: GameView(shouldPopToRootView: self.$rootIsActive)
                .navigationBarBackButtonHidden(true).environmentObject(Game(difficulty: .easy))
                .environmentObject(SelectedCell())
                .environmentObject(UserAction()), label: {
                    Text("Easy")
                })
            .isDetailLink(false)
            .padding(.bottom, 10)
            .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            NavigationLink(destination: GameView(shouldPopToRootView: self.$rootIsActive).navigationBarBackButtonHidden(true).environmentObject(Game(difficulty: .medium)).environmentObject(SelectedCell())
                .environmentObject(UserAction())) {
                    Text("Medium")
                }
                .isDetailLink(false)
                .padding(.bottom, 10)
                .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            NavigationLink(destination: GameView(shouldPopToRootView: self.$rootIsActive).navigationBarBackButtonHidden(true).environmentObject(Game(difficulty: .hard))
                .environmentObject(SelectedCell())
                .environmentObject(UserAction())) {
                    Text("Hard")
                }
                .isDetailLink(false)
                .padding(.bottom, 10)
                .buttonStyle(GradientStyle(colors: [.teal, .indigo, .indigo]))
            
            Spacer()
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    @State static var isActive = true
    
    static var previews: some View {
        DifficultyView(rootIsActive: $isActive)
    }
}
