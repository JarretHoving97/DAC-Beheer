//
//  ReturnAbleView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 14/12/2021.
//

import SwiftUI

struct ReturnableView<Content>: View where Content: View{
    
    @StateObject var viewRouter: ViewRouter
    var content: () -> Content
    
    var views: Content {
        return content()
    }
    
    @ViewBuilder
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        viewRouter.popOverPages = .clear
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill").tint(Color.red)
                        .padding(.trailing, 20)
                }
            }
            views
        }
    }
}
