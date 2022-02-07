//
//  NewsDetailView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 06/02/2022.
//

import SwiftUI

struct NewsDetailView: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    titleSectionView(title: "Bericht titel:", font: (name: .extraBold, size: .large))
                    HStack {
                       
                        Text("Nieuws artikel Titel Maar dan nog wat langer want text moet wel Dynamisch zijn")
                            .themedFont(name: .bold, size: .title)
                            .frame(width: UIScreen.main.bounds.size.width - 24, alignment: .leading)
                            .padding(.leading, 17)
                        Spacer()
                    }
                    titleSectionView(title: "Foto(s):", font: (name: .extraBold, size: .largeValutaSub))
                    HStack {
                        Spacer()
                            Image("example_2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.9)
                        Spacer()
                    }
                    titleSectionView(title: "Content:", font: (name: .extraBold, size: .largeValutaSub))
                    HStack {
                        Text("ommodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.")
                            .themedFont(name: .regular, size: .regular)
                            .padding(.leading, 17)
                        Spacer()
                    }
                    titleSectionView(title: "Geplaatst op datum:", font: (name: .extraBold, size: .largeValutaSub))
                    HStack {
                        Text("12-06-2022")
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


struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
