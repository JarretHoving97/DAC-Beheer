//
//  ViewRouter.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//

import SwiftUI

//@Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur. SwiftUI will automatically monitor for such changes, and re-invoke the body property of any views that rely on the data.
//
//In practical terms, that means whenever an object with a property marked @Published is changed, all views using that object will be reloaded to reflect those changes.
class ViewRouer: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case verify
    case issues
}
