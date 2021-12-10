//
//  SystemColors.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/12/2021.
//

import Foundation
import SwiftUI

struct SystemColors {
    
    static var theme1: Color {
        return colorSet(.theme)
    }
    
    static var background: Color {
        return colorSet(.background)
    }
    
    static var backgroundTextColor: Color {
        return colorSet(.theme)
    }
    
    static var itemTextColor: Color {
        return .white
    }
    
    enum SystemColorsName: String {
        case theme = "theme"
        case background = "background"
    }
    
}

extension SystemColors {
    
    static func colorSet(_ colorName: SystemColorsName) -> Color {
        return Color(colorName.rawValue)
    }
}
