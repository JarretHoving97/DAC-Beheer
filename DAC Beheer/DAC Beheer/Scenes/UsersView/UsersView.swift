//
//  UsersView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import SwiftUI
import UIKit

struct UsersView: View {
    
    @ObservedObject var viewModel = UsersViewModel()
    
    
    var body: some View {
    
        NavigationStack {
            
            List {
                ForEach(viewModel.users) { user in
                    
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        UserRepeatableView(user: user)
                    }
            
                    
                }
            }
            .ignoresSafeArea(.all)

        }
    }
    
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
