//
//  ContentView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            MainTabbar(viewRouter: viewRouter)
            MainNavigation(viewRouter: viewRouter) /// view on top of tabbar, r
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
         
    }
}
