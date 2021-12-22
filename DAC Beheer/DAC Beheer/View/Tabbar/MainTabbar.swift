//
//  MainTabbar.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//

import SwiftUI

struct MainTabbar: View {

    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    HomeView(viewRouter: viewRouter)
                case .issues:
                    Text("Issues")
                case .verify:
                    VerifyNavigationView()
                }
                Spacer()
            }
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    
                    TabBarButton(viewRouter: viewRouter, assingedPage: .issues, image: SystemSymbol.issue, style: .bordered, identifier: 0)
                    
                    TabBarButton(viewRouter: viewRouter, assingedPage: .home, image: SystemSymbol.home, style: .filled, identifier: 1)
                    
                    TabBarButton(viewRouter: viewRouter, assingedPage: .verify, image: SystemSymbol.verifyUser, style: .bordered, identifier: 3)
                }
                .frame(height: 78, alignment: .center)
                .background(SystemColors.tabbar)
                .cornerRadius(15)
                .padding(.horizontal)
                .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                .background(.clear)
            }
        }
    }
}

struct MainTabbar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
