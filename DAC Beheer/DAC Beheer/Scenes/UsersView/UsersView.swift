//
//  UsersView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import SwiftUI

struct UsersView: View {
    var body: some View {
    NavigationView {
            ScrollView {
                Text("GebruikersPagina!")
            }
        
        }
        .background(SystemColors.background)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
