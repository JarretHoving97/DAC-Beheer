//
//  SystemColors.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/12/2021.
//

import Foundation
import SwiftUI
import UIKit

struct SystemColors {
    
    static var theme1: Color {
        return colorSet(.theme)
    }
    
    static var background: Color {
        return colorSet(.background)
    }
    
    static var itemTextColor: Color {
        return .white
    }
    
    static var backgroundText: Color {
        return colorSet(.backgroundText)
    }
    
    static var tabbar: Color {
        return colorSet(.tabbarColor)
    }
    
    //white when darkmode on, black when lightmode on
    static var tabbarColorReversed: Color {
        return colorSet(.tabbarColorReversed)
    }
}

enum SystemColorsName: String {
    case theme = "theme"
    case background = "background"
    case tabbarColor = "tabbar_color"
    case tabbarColorReversed = "tabbar_color_reversed"
    case backgroundText = "background_text_color"
}

extension SystemColors {
    
    static func colorSet(_ colorName: SystemColorsName) -> Color {
        return Color(colorName.rawValue)
    }
}


