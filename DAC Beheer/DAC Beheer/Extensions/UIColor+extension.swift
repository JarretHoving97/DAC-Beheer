//
//  UIColor+extension.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import Foundation
import UIKit

extension UIColor {
    
    enum SystemColorsName: String {
        case theme = "theme"
        case background = "background"
        case tabbarColor = "tabbar_color"
        case tabbarColorReversed = "tabbar_color_reversed"
        case backgroundText = "background_text_color"
    }
    
    var backgroundColor: UIColor {
        .setColor(.background)
    }
    
    var themeColor: UIColor {
        .setColor(.theme)
    }
    
    var backgroundTextColor: UIColor {
        .setColor(.backgroundText)
    }
}

extension UIColor {
    static func setColor(_ colorName: SystemColorsName) -> UIColor {
        return UIColor(named: colorName.rawValue) ?? .blue
    }
}
