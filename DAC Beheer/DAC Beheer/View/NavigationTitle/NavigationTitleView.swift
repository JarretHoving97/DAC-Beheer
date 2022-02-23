//
//  SwiftUIView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/02/2022.
//

import SwiftUI

struct NavigationTitleView: View {
    
    let titleText: String
    
    var body: some View {
        Text(titleText)
            .themedFont(name: .extraBold, size: .large)
            .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
            .padding(.leading, 17)
            .foregroundColor(SystemColors.backgroundText)
    }
}

struct NavigationTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTitleView(titleText: "test")
    }
}
