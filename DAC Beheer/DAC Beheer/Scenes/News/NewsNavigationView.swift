//
//  NewsNavigationView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct NewsNavigationView: View {
    
    @StateObject var navigationController = NavigationRouter()
    
    var body: some View {
        ZStack{
            VStack {
                Text("Nieuws 🗞")
                    .themedFont(name: .extraBold, size: .large)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                    .padding(.leading, 17)
                    .foregroundColor(SystemColors.backgroundText)
                
                NewsListView(navigationView: navigationController)
                
            }
            .background(SystemColors.background)
            
            NavigationsReturnableView(navigationViewRouter: navigationController) {
                navigationController.currentPresentedView
            }
        }
    }
}

struct NewsNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NewsNavigationView()
    }
}
