//
//  ContentView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouer
    @State var selectedTab: Int = 1
    
    var body: some View {
        MainTabbar(viewRouter: viewRouter, selectedTab: $selectedTab)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouer())
         
    }
}
