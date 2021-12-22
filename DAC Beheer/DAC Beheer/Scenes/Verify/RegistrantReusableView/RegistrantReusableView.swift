//
//  RegistrantReusableView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import SwiftUI

struct RegistrantReusableView: View {
    
    let newRegistrant: NewRegistrant
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(newRegistrant.fullName)
                        .themedFont(name: .bold, size: .regular)
                    
                    Text("Heeft zich geregistreerd als \(newRegistrant.role ?? "")")
                        .themedFont(name: .regular, size: .regular)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Met lidnummer: \(newRegistrant.membershipNumber ?? "")")
                        .themedFont(name: .regular, size: .regular)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(newRegistrant.date)
                        .themedFont(name: .regular, size: .regular)
                }
                .padding(17)
                .themedFont(name: .bold, size: .large)
                .foregroundColor(SystemColors.backgroundText)
                Spacer()
            }
            
            .background(SystemColors.background)
            .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
        }
        .padding(.trailing, 17)
        .padding(.leading, 17)
        .padding(.bottom, 11)
    }
}


struct RegistrantReusableView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrantReusableView(newRegistrant: NewRegistrant(id: "214", firstName: "Jarret", lastName: "Hoving", verified: true, phone: "31615180608", role: "Admin", membershipNumber: "4", createdAt: "2021-12-22T15:49:15.000Z"))
    }
}
