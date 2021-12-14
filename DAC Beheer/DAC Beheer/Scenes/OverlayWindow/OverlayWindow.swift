//
//  OverlayWindow.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import SwiftUI

struct OverlayWindow: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var shouldPresentView: Bool {
        return viewRouter.popOverPages != .clear
    }
    
    var body: some View {
        
       if shouldPresentView {
            Text("succes :D")
       } else {
           Text("")
       }
    }
}

struct OverlayWindow_Previews: PreviewProvider {
    static var previews: some View {
        OverlayWindow(viewRouter: ViewRouter())
    }
}
