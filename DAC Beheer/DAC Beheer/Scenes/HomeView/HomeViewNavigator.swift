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
            return AnyView(UsersView())
        default:
            print("no view found")
            return nil
        }
    }
}
