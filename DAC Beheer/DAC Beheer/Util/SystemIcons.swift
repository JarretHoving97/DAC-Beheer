//
//  SystemIcons.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//


import Foundation
import SwiftUI

struct SystemSymbol {
    
    static var verifyUser: Image {
        return themed(.verifyUser)
    }
    
    static var home: Image {
      return themed(.home)
    }
    
    static var issue: Image {
      return themed(.issue)
    }
    
    enum SystemIcon: String {
        case home = "ic_home_tabbar"
        case issue = "ic_issue_tabbar"
        case verifyUser = "ic_verify_user_tabbar"
    }

}

extension SystemSymbol {
    static func themed(_ iconName: SystemIcon) -> Image {
        return Image(iconName.rawValue)
    }
}
