//
//  NavigationReturnable.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 16/04/2022.
//

import Foundation
import SwiftUI


protocol NavigationReturnable {
    var viewRouter: ViewRouter { get }
    var navigationRouter: NavigationRouter { get }
    
    func presentNextView(_ view: AnyView)
    func presentationDidEnd()
}
