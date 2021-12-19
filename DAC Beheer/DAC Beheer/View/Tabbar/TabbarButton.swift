//
//  TabbarButton.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//

import Foundation
import SwiftUI

struct TabBarButton: View {
    
    enum ButtonStyle {
        case bordered
        case filled
    }
    @StateObject var viewRouter: ViewRouter
    
    var selected: Bool {
        return viewRouter.currentPage == assingedPage
    }
    
    let assingedPage: Page
    var image: Image
    var style: ButtonStyle
    let identifier: Int
    
    var body: some View {
        
        // For getting mid Point of eacht button
        GeometryReader { reader in
            
            Button(action: {
                // changing tab..
                withAnimation {
                    viewRouter.currentPage = assingedPage
                }
            }, label: {
                ZStack {
                    switch style {
                    case .bordered:
                        SystemColors.tabbar
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(SystemColors.theme1 , lineWidth: selected ? 5 : 0)
                            )
                            .cornerRadius(10)
                            .frame(width: 53, height: 53)
                        
                            .shadow(color: selected ? .black.opacity(0.25) : .clear, radius: selected ? 4: 0, x: 0, y: selected ? 6: 0)
                        
                    case .filled:
                        SystemColors.theme1
                            .cornerRadius(10)
                            .frame(width: 53, height: 50)
                            .themedFont(name: .medium, size: .small)
                            .shadow(color: .black.opacity(0.25), radius: selected ? 4: 0, x: 0, y: selected ? 6: 0)
                    }
                    image
                    
                }
            })
                .offset(y: selected ? -10 : 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        // maximum height
        .frame(height: 50)
    }
}

struct TabbarButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
