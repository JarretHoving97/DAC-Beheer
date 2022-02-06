//
//  HomeViewNavigator.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import Foundation
import SwiftUI

struct HomeViewNavigator {
   static func selectMenuItem(_ option: MenuOption) -> AnyView? {
        switch option {
        case .users:
            return AnyView(UserNavigation())
        case .events:
            return AnyView(EventNavigationView())
        case .matches:
            return AnyView(MatchNavigationView())
        case .news:
            return AnyView(NewsNavigationView())
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
