//
//  VerifyNavigationView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import SwiftUI

struct VerifyNavigationView: View {
    var body: some View {
        VStack {
//            Text("Aanmeldingen 📝")
//                .themedFont(name: .extraBold, size: .large)
//                .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
//                .padding(.leading, 17)
//                .foregroundColor(SystemColors.backgroundText)
            
            VerifyRegistrantsView()
        }
    }
}

struct VerifyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyNavigationView()
    }
}
