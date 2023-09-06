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
import CoreData

struct ContentView: View {
    var body: some View {
        MenuView()
            .environmentObject(Game(difficulty: .easy))
            .environmentObject(HighscoreData())
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
