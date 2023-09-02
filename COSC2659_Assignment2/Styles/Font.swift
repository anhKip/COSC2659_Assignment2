//
//  Font.swift
//  COSC2659_Assignment2
//
//  Created by Tran Anh Hung on 02/09/2023.
//

import Foundation
import SwiftUI

struct MyFont {
    
    /// Create a font with the large title text style
    static let largeTitle = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize + 2)
    
    /// Create a font with the title text style.
    static let title = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize + 2)
    
    /// Create a font with the headline text style.
    static let headline = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .headline).pointSize + 2)
    
    /// Create a font with the subheadline text style.
    static let subheadline = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize + 2)
    
    /// Create a font with the body text style.
    static let body = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize + 2)
    
    /// Create a font with the callout text style.
    static let callout = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .callout).pointSize + 2)
    
    /// Create a font with the footnote text style.
    static let footnote = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize + 2)
    
    /// Create a font with the caption text style.
    static let caption = Font.custom("Itim-Regular", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize + 2)
}
