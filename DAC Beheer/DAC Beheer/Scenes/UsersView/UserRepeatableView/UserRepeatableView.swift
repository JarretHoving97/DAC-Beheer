//
//  UserRepeatableView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct UserRepeatableView: View {
    
    var user: UserModel
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(user.fullName)
                    .themedFont(name: .semiBold, size: .largeValutaSub)
                Text("Speler bij \(user.team ?? "")")
                    .themedFont(name: .bold, size: .regular)
                Text(user.function ?? "")
                    .themedFont(name:.bold, size: .regular)
                Spacer()
            }
            .padding(17)
            .themedFont(name: .bold, size: .large)
            .foregroundColor(SystemColors.itemTextColor)
            Spacer()
        }
        .background(SystemColors.theme1)
        .frame(width: UIScreen.main.bounds.size.width - 24, height: 108)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
    }
}

struct UserRepeatableView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
