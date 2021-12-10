//
//  SwiftUIView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//

import SwiftUI
//
struct HomeView: View {
    @State var selectedTab = 1
    @StateObject var viewRouter = ViewRouer()
    var body: some View {
        
        ZStack(alignment: .bottom) {
            SystemColors.colorSet(.background)
                .ignoresSafeArea()
            
            MainTabbar(viewRouter: viewRouter, selectedTab: $selectedTab)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
