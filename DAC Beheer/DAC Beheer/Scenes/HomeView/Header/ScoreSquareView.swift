//
//  ScoreSquareView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 11/12/2021.
//

import SwiftUI

struct ScoreSquareView: View {
    
    let centeredText: String
    let additionalInfo: String
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Spacer()
            Text(centeredText)
                .themedFont(name: .bold, size: .large).foregroundColor(SystemColors.itemTextColor)
                .frame(width: 20, height: 20, alignment: .center)
            Spacer()
            HStack {
                Spacer()
                Text(additionalInfo)
                    .themedFont(name: .semiBold, size: .subLabel).foregroundColor(SystemColors.itemTextColor)
                    .padding(.trailing, 10)
                    .padding(.bottom, 10)
            }
        }
        .background(SystemColors.theme1)
    }
}

struct ScoreSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSquareView(centeredText: "6", additionalInfo: "2 thuis")
    }
}
