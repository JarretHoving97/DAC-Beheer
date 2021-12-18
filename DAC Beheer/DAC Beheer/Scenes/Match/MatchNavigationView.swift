//
//  MatchNavigationView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct MatchNavigationView: View {
    var body: some View {
        VStack {
            Text("Wedstrijden")
                .themedFont(name: .extraBold, size: .large)
                .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                .padding(.leading, 17)
                .foregroundColor(SystemColors.backgroundText)
            
            ScrollView {}// content
        }
        .background(SystemColors.background)
    }
}

struct MatchNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MatchNavigationView()
    }
}
