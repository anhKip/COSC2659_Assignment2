/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Tran Minh Anh
 ID: S3931980
 Created date: 04/09/2023
 Last modified: 06/09/2023
 Acknowledgement:
 https://www.youtube.com/watch?v=-UUyo3bOlys
 */

import Foundation

class HighscoreData : ObservableObject {
    @Published var highscores : [Highscore]
    
    init() {
        self.highscores = [Highscore(name: "", score: 0)]
        highscores = readHighscoreJSON(from: "highscore")
    }
    
    func writeHighscoreJSON(to filename: String) {
        let fm = FileManager.default
        var url : URL
        
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            url = documentDirectory.appendingPathComponent("highscore.json")
        } catch {
            print("In writeHighscoreJSON: Couldn't create URL")
            url = Bundle.main.url(forResource: "highscore", withExtension: "json")!
        }
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let jsonData = try encoder.encode(self.highscores)
            try jsonData.write(to: url)
        } catch {
            print("Error in writeJSON: \(error)")
        }
    }
    
    func readHighscoreJSON<T: Decodable>(from filename: String) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("In readHighscoreJSON: Failed to locate \(filename) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("In readHighscoreJSON: Failed to load \(filename) from bundle.")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("In readHighscoreJSON: Failed to decode \(filename).")
        }
        print(loaded)
        return loaded
    }
}




