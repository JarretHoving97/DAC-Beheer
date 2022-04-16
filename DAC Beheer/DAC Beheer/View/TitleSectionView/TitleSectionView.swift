//
//  TitleSectionView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 26/02/2022.
//

import SwiftUI

struct titleSectionView: View {
    
    let title: String
    let font: (name: ScaledFont.ThemeFont, size: ScaledFont.ThemeFontSize)
    var color: Color?

    var body: some View {
        HStack {
            Text(title)
                .themedFont(name: font.name, size: font.size)
                .foregroundColor(color)
            Spacer()
        }
    }
}
