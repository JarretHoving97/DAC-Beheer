//
//  UserNavigation.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct UserNavigation: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            Text("Leden overzicht")
                .themedFont(name: .extraBold, size: .large)
                .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                .padding(.leading, 17)
                .foregroundColor(SystemColors.backgroundText)
            
            SearchBarView()
            
            UsersView()
                .navigationTitle("Leden overzicht")
                .searchable(text: $searchText)
        }
        .background(SystemColors.background)
        
    }
}

struct UserNavigation_Previews: PreviewProvider {
    static var previews: some View {
        UserNavigation()
    }
}
