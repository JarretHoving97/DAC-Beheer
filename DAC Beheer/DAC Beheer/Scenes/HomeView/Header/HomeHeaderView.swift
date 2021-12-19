//
//  HomeHeaderView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 11/12/2021.
//

import SwiftUI

struct HomeHeaderView: View {
    
    let model = homeHeaderModel(clubName: "Volleybal Dedemsvaart", matchesCount: "6", eventsCount: "7", refereeCount: "12")
    
    var body: some View {

        VStack(spacing: 0) {
            HStack {
                Text(model.clubName)
                    .frame(height: 40, alignment: .leading)
                    .themedFont(name: .bold, size: .numberpad).foregroundColor(.white)
                    .padding(.top, 11)
                .padding(.leading, 16)
                
                Spacer()
            }
            HStack {
                Text("Deze week:")
                    .frame(height: 35, alignment: .leading)
                    .themedFont(name: .semiBold, size: .largeValutaSub).foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom, 5)
                Spacer()
            }

            HStack{
                ScoreSquareView(centeredText: "5", additionalInfo: "togo")
                    .frame(width: 92, height: 88, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 5))
                Spacer()
                ScoreSquareView(centeredText: "5", additionalInfo: "togo")
                    .frame(width: 92, height: 88, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 5))
                Spacer()
                ScoreSquareView(centeredText: "5", additionalInfo: "togo")
                    .frame(width: 92, height: 88, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 5))
            }
            .padding(.trailing)
            .padding(.leading)
            .padding(.bottom)
            
            HStack {
                Text("Wedstrijden").themedFont(name: .bold, size: .regular).foregroundColor(.white)
                Spacer()
                Text("Wedstrijden").themedFont(name: .bold, size: .regular).foregroundColor(.white)
                Spacer()
                Text("Wedstrijden").themedFont(name: .bold, size: .regular).foregroundColor(.white)
            }
            .padding(.leading)
            .padding(.trailing)
            Spacer()
        }
        .background(SystemColors.theme1)
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
.previewInterfaceOrientation(.portrait)
    }
}

struct homeHeaderModel {
    let clubName: String
    let matchesCount: String
    let eventsCount: String
    let refereeCount: String
}
