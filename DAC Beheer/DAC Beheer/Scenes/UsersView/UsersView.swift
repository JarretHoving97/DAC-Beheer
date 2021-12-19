//
//  UsersView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import SwiftUI

struct UsersView: View {
    var body: some View {
        
        ScrollView {
            VStack(spacing: 13) {
                //Searchabr
                UserRepeatableView(user: .init(firstName: "Jarret", lastName: "Hoving", team: "H1", function: "App developer"))
                UserRepeatableView(user: .init(firstName: "Jarret", lastName: "Hoving", team: "H1", function: "App developer"))
                UserRepeatableView(user: .init(firstName: "Jarret", lastName: "Hoving", team: "H1", function: "App developer"))
                
                //repeatable cell
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
