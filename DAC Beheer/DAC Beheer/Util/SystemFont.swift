//
//  SystemFont.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/12/2021.
//

import Foundation
import UIKit
import SwiftUI

struct ScaledFont: ViewModifier {
    
    enum ThemeFont: String {
        /// BalooBha2-Regular
        case regular = "BalooBhai2-Regular"
        
        /// BalooBha2-Bold
        case bold = "BalooBhai2-Bold"
        
        /// BalooBhai2-SemiBold
        case semiBold = "BalooBhai2-SemiBold"
        
        /// BalooBhai2-ExtraBold
        case extraBold = "BalooBhai2-ExtraBold"
        
        /// BalooBhai2-medium
        case medium = "BalooBhai2-Medium"
    }
    
    enum ThemeFontSize: CGFloat {
        /// 8 pt
        case extraSmall = 8.0
        /// 11 pt
        case tabbarItem = 11.0
        /// 12 pt
        case small = 12.0
        /// 13 pt
        case legal = 13.0
        /// 14 pt
        case subtitle = 14.0
        /// 16 pt
        case regular = 16.0
        /// 18 pt
        case title = 18.0
        /// 28 pt
        case numberpad = 28.0
        /// 34 pt
        case large = 34.0
        /// 24 pt
        case largeValutaSub = 24
        /// 56 pt
        case largeValuta = 56
        
        // 9pt
        case subLabel = 9
    }
    
    var name: ThemeFont
    var size: ThemeFontSize
    
    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size.rawValue)
//        print("scaledSize: \(scaledSize), name: \(name.rawValue)")
        return content.font(.custom(name.rawValue, size: scaledSize))
    }
}

extension View {
    func themedFont(name: ScaledFont.ThemeFont, size: ScaledFont.ThemeFontSize) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}

