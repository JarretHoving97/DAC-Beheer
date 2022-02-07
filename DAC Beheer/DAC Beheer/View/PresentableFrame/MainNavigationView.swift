//
//  PopOverFrame.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import Foundation
import SwiftUI

/// Build a view on top of tabbar views
/// set viewRouter.popOverPages to .clear to remove any view ad return to tabbar
struct MainNavigation: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        Group(content: contentBuilder)
    }
    
    var viewIsEmpty: Bool {
        return viewRouter.rootView == .clear
    }
    
    @ViewBuilder
    func contentBuilder() -> some View {
        ReturnableView(viewRouter: viewRouter) {
            RootViewNavigator.selectMenuItem(viewRouter.rootView, viewRouter: viewRouter)
        }
    }
}

struct PresentableFrame_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
