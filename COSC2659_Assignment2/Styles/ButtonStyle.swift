/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2023B
    Assessment: Assignment 1
    Author: Tran Minh Anh
    ID: s3931980
    Created date: 30/08/2023
    Last modified: 01/09/2023
    Acknowledgement:
    https://www.kodeco.com/34851726-swiftui-button-tutorial-customization
 */

import Foundation
import SwiftUI

extension ButtonStyle where Self == GradientStyle {
    static var gradient: GradientStyle { .init() }
}

struct GradientStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    private let colors: [Color]

    init(colors: [Color] = [.mint.opacity(0.6), .mint, .mint.opacity(0.6), .mint]) {
      self.colors = colors
    }

    func makeBody(configuration: Configuration) -> some View {
      HStack {
        configuration.label
      }
      .font(.body.bold())
      .foregroundColor(isEnabled ? .white : .black)
      .padding()
      .frame(width: 180,height: 44)
      .background(backgroundView(configuration: configuration))
      .cornerRadius(10)
    }

    @ViewBuilder private func backgroundView(configuration: Configuration) -> some View {
      if !isEnabled {
        disabledBackground
      } else if configuration.isPressed {
        pressedBackground
      } else {
        enabledBackground
      }
    }

    private var enabledBackground: some View {
      LinearGradient(
        colors: colors,
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    }

    private var disabledBackground: some View {
      LinearGradient(
        colors: [.gray],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    }

    private var pressedBackground: some View {
      LinearGradient(
        colors: colors,
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
      .opacity(0.4)
    }
}

/*
Certainly! Here's an example of a custom ButtonStyle for a Sudoku game menu using SwiftUI:

```swift
struct SudokuButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(configuration.isPressed ? Color.gray.opacity(0.7) : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.headline)
    }
}
```

With this custom ButtonStyle, the buttons in your Sudoku game menu will have a blue background and white text. When a button is pressed, its background color will change to a slightly transparent gray color.

To apply this style to a button, you can use the `.buttonStyle(SudokuButtonStyle())` modifier:

```swift
Button(action: {
    // Handle button tap here
}) {
    Text("Play")
}
.buttonStyle(SudokuButtonStyle())
```

You can customize the colors, font, and padding as per your requirements. Hope this helps you create a beautiful Sudoku game menu in SwiftUI!
*/
