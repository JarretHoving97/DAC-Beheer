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
    
    static var tabbar: Color {
        return colorSet(.tabbarColor)
    }
    
    enum SystemColorsName: String {
        case theme = "theme"
        case background = "background"
        case tabbarColor = "tabbar_color"
    }
    
}

extension SystemColors {
    
    static func colorSet(_ colorName: SystemColorsName) -> Color {
        return Color(colorName.rawValue)
    }
}
