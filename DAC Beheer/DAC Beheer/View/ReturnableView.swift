//
//  ReturnAbleView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import SwiftUI

/// ReturnableView is a frame that returns a view. It will be om top of ContentView
/// Tis will accept anyview so you can pass in anything u want.
struct ReturnableView<Content>: View where Content: View {
    
    @StateObject var viewRouter: ViewRouter
    var content: () -> Content
    
    var views: Content {
        return content()
    }
    
    var hasViews: Bool {
        return viewRouter.popOverPages != .clear
    }
    
    @ViewBuilder
    var body: some View {
        ZStack {
            if hasViews {
                views
                VStack{
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                viewRouter.popOverPages = .clear
                            }
                        } label: {
                            Image("ic_cross_image")
                                .renderingMode(.template)
                                .tint(SystemColors.backgroundText)
                                .padding(.trailing, 20)
                                
                             
                        }
                        .padding(.top, 12)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ReturnableView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
         
    }
}

