//
//  UserDetailView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 04/07/2022.
//

import SwiftUI

struct UserDetailView: View {
    
    @State var user: UserModel
    
    var body: some View {
        
        VStack {
            Text("\(user.firstName) \(user.lastName)")
                .themedFont(name: .extraBold, size: .large)
                .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                .padding(.leading, 17)
                .foregroundColor(SystemColors.backgroundText)
            
            ScrollView {
                Group {
                    VStack {
                        JTextFieldView(title: "Voornaam", fieldType: .firstname, text: $user.firstName)
                            .padding(.bottom, 10)
                        JTextFieldView(title: "Achternaam", fieldType: .lastname, text: $user.lastName)
                            .padding(.bottom, 10)
                        JTextFieldView(title: "Telefoon", fieldType: .phone, text: $user.phone)
                            .padding(.bottom, 10)
                        JTextFieldView(title: "Lidnummer", fieldType: .regular, text: $user.membershipNumber)
                            .padding(.bottom, 10)

                        Button {
                            Api.Users.getAllUser(completion: <#T##(Result<UsersResponse, AFError>) -> Void#>)
                        } label: {
    
                            ZStack {
                                SystemColors.theme1
                                    .cornerRadius(5)
                                    .frame(height: 60, alignment: .center)
                                    .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                            
                                Text("Wijzig")
                                    .themedFont(name: .extraBold, size: .largeValutaSub)
                                    .foregroundColor(SystemColors.itemTextColor)
                            }
                        }

                    }
                    .padding()
                }
            }
        }
        .background(SystemColors.background)
    }
}
