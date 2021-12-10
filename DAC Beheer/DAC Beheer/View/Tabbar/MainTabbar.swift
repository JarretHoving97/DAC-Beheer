//
//  MainTabbar.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//

import SwiftUI

struct MainTabbar: View {

    @StateObject var viewRouter: ViewRouer
    @Binding var selectedTab: Int

    
    var body: some View {
        
        VStack {
            Spacer()
            switch viewRouter.currentPage {
            case .home:
                Text("Home")
            case .issues:
                Text("Issues")
            case .verify:
                Text("verify")
            }
            Spacer()
            
            HStack(spacing: 0) {
                
                TabBarButton(viewRouter: viewRouter, assingedPage: .issues, image: SystemSymbol.issue, style: .bordered, identifier: 0)
                
                TabBarButton(viewRouter: viewRouter, assingedPage: .home, image: SystemSymbol.home, style: .filled, identifier: 1)
                
                TabBarButton(viewRouter: viewRouter, assingedPage: .verify, image: SystemSymbol.verifyUser, style: .bordered, identifier: 3)
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
        }
    }
}

struct MainTabbar_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
