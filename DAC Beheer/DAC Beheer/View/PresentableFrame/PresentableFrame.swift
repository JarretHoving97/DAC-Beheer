//
//  PopOverFrame.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import Foundation
import SwiftUI

///Builds a view on top of contentView
///Remove any view here to viewRouter.popOverView to .clear
struct PresentableFrame: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        Group(content: contentBuilder)
    }
    
    @ViewBuilder
    func contentBuilder() -> some View {
        if viewRouter.popOverPages != .clear {
            ReturnableView(viewRouter: viewRouter) {
                HomeViewNavigator.selectMenuItem(viewRouter.popOverPages)
            }
        }
    }
}
