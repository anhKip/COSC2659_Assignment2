//
//  HighscoreView.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 06/09/2023.
//

import SwiftUI

struct LeaderboardView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var highscores: HighscoreData
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
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
            
            
            
            Spacer()
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(HighscoreData())
    }
}
