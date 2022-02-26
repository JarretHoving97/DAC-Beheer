//
//  HomeViewNavigator.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import Foundation
import SwiftUI

struct RootViewNavigator {
    
    static func selectMenuItem(_ option: MenuOption, viewRouter: ViewRouter) -> AnyView? {
    
        switch option {
        case .users:
            return AnyView(UserNavigation())
        case .events:
            return AnyView(EventNavigationView(viewRouter: viewRouter))
        case .matches:
            return AnyView(MatchNavigationView())
        case .news:
            return AnyView(NewsNavigationView(viewRouter: viewRouter))
        case .teams:
            return AnyView(TeamNavigationView())
        default:
            Log.debug("no view found")
            return nil
        }
    }
}


struct HomeViewNavigator_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
