//
//  DAC_BeheerApp.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/12/2021.
//

import SwiftUI

@main
struct DAC_BeheerApp: App {
    
    @StateObject var viewRouter = ViewRouter()

    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .background(SystemColors.background)
        }
    }
}
