//
//  UserNavigation.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct UserNavigation: View {
        
   @ObservedObject var viewModel = UsersViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Leden overzicht")
                    .themedFont(name: .extraBold, size: .large)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                    .padding(.leading, 17)
                    .foregroundColor(SystemColors.backgroundText)
                
                ScrollView {
                    ForEach(viewModel.users) { user in
                            NavigationLink {
                                UserDetailView(user: user)
                            } label: {
                                UserRepeatableView(user: user)
                                    .padding(.trailing, 17)
                                    .padding(.leading, 17)
                            }
                        }
                        .listRowSeparator(.hidden)
                    .menuIndicator(.hidden)
                }
          
              Spacer()
            }
            .background(SystemColors.background)
        }
        .navigationTitle("Gebruikers")
        .foregroundColor(SystemColors.backgroundText)
        .navigationBarTitleDisplayMode(.large)
    }
        
}

struct UserNavigation_Previews: PreviewProvider {
    static var previews: some View {
        UserNavigation()
    }
}
