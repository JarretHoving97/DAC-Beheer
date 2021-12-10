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
    @StateObject var viewRouter: ViewRouer
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
                        Color.white
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(SystemColors.theme1 , lineWidth: 3)
                            )
                            .cornerRadius(10)
                            .frame(width: 53, height: 53)
                            
                            .shadow(color: SystemColors.theme1.opacity(0.65), radius: viewRouter.currentPage == assingedPage ? 4: 0, x: 0, y: viewRouter.currentPage == assingedPage ? 6: 0)
                           
                    case .filled:
                        SystemColors.theme1
                            .cornerRadius(10)
                            .frame(width: 53, height: 50)
                            .themedFont(name: .medium, size: .small)
                            .shadow(color: .black.opacity(0.25), radius: viewRouter.currentPage == assingedPage ? 4: 0, x: 0, y: viewRouter.currentPage == assingedPage ? 6: 0)
                    }
                    image
                        
                }
            })
                .offset(y: viewRouter.currentPage == assingedPage ? -10 : 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        // maximum height
        .frame(height: 50)
    }
}

struct TabbarButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
