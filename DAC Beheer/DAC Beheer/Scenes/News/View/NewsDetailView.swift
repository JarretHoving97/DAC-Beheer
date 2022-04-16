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
    
    var hasImage: Bool {
        return image != nil
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: spacing) {
                    titleSectionView(title: "Titel", font: (name: .extraBold, size: .small))
                        .padding(.leading, 10)
                    HStack {
                       
                        Text(newsTitle)
                            .themedFont(name: .bold, size: .title)
                            .frame(width: UIScreen.main.bounds.size.width - 24, alignment: .leading)
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                        Spacer()
                    }
            
                    if hasImage {
                        titleSectionView(title: "Foto(s)", font: (name: .extraBold, size: .small))
                            .padding(.leading, 10)
                        HStack {
                            Spacer()
                      
                            WebImage(url: WebImageHelper.imageUrl(image))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.9)
                            Spacer()
                        }
                    }
                    titleSectionView(title: "Omschrijving", font: (name: .extraBold, size: .small))
                        .padding(.leading, 10)
                    HStack {
                        Text(content)
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        
                        Spacer()
                    }
                    titleSectionView(title: "Publicatie datum", font: (name: .extraBold, size: .small))
                        .padding(.leading, 10)
                    HStack {
                        Text(date.serverDateString(to: .simpleFormat))
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)

                    }
                }
            }
            .background(SystemColors.background)
        }
    }
}

