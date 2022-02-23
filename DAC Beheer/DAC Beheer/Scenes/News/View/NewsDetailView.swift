//
//  NewsDetailView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 06/02/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    
    let newsTitle: String
    let content: String
    let date: String
    let image: String?
    
    let spacing: CGFloat = 4
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: spacing) {
                    titleSectionView(title: "Bericht titel:", font: (name: .extraBold, size: .small))
                    HStack {
                       
                        Text(newsTitle)
                            .themedFont(name: .bold, size: .title)
                            .frame(width: UIScreen.main.bounds.size.width - 24, alignment: .leading)
                            .padding(.leading, 17)
                        Spacer()
                    }
                    titleSectionView(title: "Foto(s):", font: (name: .extraBold, size: .small))
                    HStack {
                        Spacer()
                  
                        WebImage(url: WebImageHelper.imageUrl(image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                        Spacer()
                    }
                    titleSectionView(title: "Content:", font: (name: .extraBold, size: .small))
                    HStack {
                        Text(content)
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 17)
                        Spacer()
                    }
                    titleSectionView(title: "Geplaatst op datum:", font: (name: .extraBold, size: .small))
                    HStack {
                        Text(date.serverDateString(to: .simpleFormat))
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 17)
                    }
                    
                }
            }
            .background(SystemColors.background)
        }
    }
}

struct titleSectionView: View {
    
    let title: String
    let font: (name: ScaledFont.ThemeFont, size: ScaledFont.ThemeFontSize)

    var body: some View {
        HStack {
            Text(title)
                .themedFont(name: font.name, size: font.size)
        }
        .padding(.leading, 17)
    }
}
