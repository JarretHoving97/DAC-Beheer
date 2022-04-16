//
//  EditEventView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 11/04/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventOverViewView: View {
    
    let event: Event
    
    var hasImage: Bool {
        return event.image != nil
    }
    
    let spacing: CGFloat = 4
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: spacing) {
                    
                    titleSectionView(title: "Titel", font: (name: .extraBold, size: .small))
                        .padding(.leading, 10)
                    HStack {
                        
                        Text(event.title)
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
                            
                            WebImage(url: WebImageHelper.imageUrl(event.image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                            Spacer()
                        }
                    }
                    
                    titleSectionView(title: "Inschrijven vanaf", font: (name: .extraBold, size: .small))
                        .padding(.leading, 10)
                    
                    HStack {
                        Text(event.registerFrom.serverDateString(to: .elegant, timeFormatOnly: true))
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                        Spacer()
                    }
                    
                    titleSectionView(title: "Inschrijven tot", font: (name: .extraBold, size: .small))
                        .padding(.leading, 10)
                    
                    HStack {
                        Text(event.registerTill.serverDateString(to: .elegant, timeFormatOnly: true))
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                        Spacer()
                    }
                    
                    Group {
                        titleSectionView(title: "Evenement datum", font: (name: .extraBold, size: .small))
                            .padding(.leading, 10)
                        
                        HStack {
                            Text(event.eventDate.serverDateString(to: .elegant, timeFormatOnly: true))
                                .themedFont(name: .regular, size: .regular)
                                .padding(.leading, 12)
                                .padding(.trailing, 12)
                            Spacer()
                        }
                        
                        titleSectionView(title: "Content", font: (name: .extraBold, size: .small))
                            .padding(.leading, 10)
                        
                        HStack {
                            Text(event.content)
                                .themedFont(name: .regular, size: .regular)
                                .padding(.leading, 12)
                                .padding(.trailing, 12)
                        }
                        
                        titleSectionView(title: "Alleen voor leden", font: (name: .extraBold, size: .small))
                            .padding(.leading, 10)
                        
                        Text(event.membersOnly.localized())
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                    }
                }
            }
            .background(SystemColors.background)
        }
    }
}


