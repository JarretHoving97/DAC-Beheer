//
//  UserDetailView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 04/07/2022.
//

import SwiftUI

struct UserDetailView: View {
    
    let user: UserModel
    
    var body: some View {
        
        VStack {
            Text(user.firstName)
            Text(user.lastName)
            Text(user.isVerified.description)
        }
        .background(Color.red)
        
    }
}
