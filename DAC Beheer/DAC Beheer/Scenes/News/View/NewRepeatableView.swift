//
//  NewRepeatableView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 04/02/2022.
//

import SwiftUI

struct NewsRepeatableView: View {
    
    var newsItem: NewsItem
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(newsItem.title)
                    .themedFont(name: .semiBold, size: .largeValutaSub)
                Spacer()
                Text(newsItem.createdAt.serverDateString(to: .simpleFormat))
                    .themedFont(name: .regular, size: .regular)
                Spacer()
            }
            .padding(17)
            .themedFont(name: .bold, size: .large)
            .foregroundColor(SystemColors.itemTextColor)
            Spacer()
        }
        .background(SystemColors.theme1)
        .frame(width: UIScreen.main.bounds.size.width - 24, height: 108)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
    }
}
