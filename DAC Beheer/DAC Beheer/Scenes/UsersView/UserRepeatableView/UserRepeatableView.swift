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
                
                Text(user.membershipNumber)
                    .themedFont(name:.bold, size: .regular)
                
                Text(user.phone)
                    .themedFont(name: .bold, size: .regular)
                Spacer()
            }
            .padding(17)
            .themedFont(name: .bold, size: .large)
            .foregroundColor(SystemColors.itemTextColor)
            Spacer()
        }
        .background(SystemColors.theme1)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
    }
}

struct UserRepeatableView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepeatableView(user: UserModel(id: "2", firstName: "Jarret", lastName: "Hoving", phone: "615180508", membershipNumber: "zeum724", createdAt: "vandaag", updatedAt: "morgen", isVerified: true))
    }
}
