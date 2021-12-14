//
//  MenuButtons.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 13/12/2021.
//

import Foundation
import SwiftUI


enum MenuOption: String {
    case events = "Evenementen"
    case matches = "Wedstrijden"
    case teams = "Team indelingen"
    case users = "Gebruikers"
    case news = "Nieuws"
    case clear = ""
}

enum MenuOption1: String {
    case events
    case matches
    case teams
    case users
    case news
    case clear
}

struct MenuModel {
    static var menuItems: [MenuOption] {
        [.events, .matches, .teams, .users, .news]
    }
    
   static func getButtonForItem(option: MenuOption) -> MenuButton {
        switch option {
        case .events:
            return MenuButton(imageName: "event_menu_image", subTitle: option.rawValue)
        case .matches:
            return MenuButton(imageName: "volleyball_menu_image", subTitle: option.rawValue)
        case .teams:
            return MenuButton(imageName: "teams_menu_image", subTitle: option.rawValue)
        case .users:
            return MenuButton(imageName: "users_menu_image", subTitle: option.rawValue)
        case .news:
            return MenuButton(imageName: "news_menu_image", subTitle: option.rawValue)
        case .clear:
            return MenuButton(imageName: "", subTitle: "")
        }
    }
}

struct MenuButton {
    let imageName: String
    let subTitle: String
}
