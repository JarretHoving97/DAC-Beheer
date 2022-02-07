//
//  SwiftUIView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = 1
    @StateObject var viewRouter: ViewRouter
    
    var items: [GridItem] {
        Array(repeating: .init(.flexible()), count: MenuModel.menuItems.count)
    }
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LazyVGrid(columns: columns, spacing: 21) {
                    ForEach(MenuModel.menuItems, id: \.self) { item in
                        let model = MenuModel.getButtonForItem(option: item)
                        Button {
                            withAnimation {
                                viewRouter.rootView = item
                            }
                        } label: {
                            MenuButtonsViewModel(model: model)
                                .frame(maxWidth: 169,  maxHeight: 153,   alignment: .center)
                                .aspectRatio(1, contentMode: .fill)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                        }
                    }
                    Button {
                        withAnimation {
//                            viewRouter.popOverPages =
                        }
                    } label: {
                        SettingsView()
                            .background(SystemColors.background)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(SystemColors.backgroundText, lineWidth: 2)
                            )
                            .frame(maxWidth: 169,  maxHeight: 153,   alignment: .center)
                            .aspectRatio(1, contentMode: .fill)
                           
    
                    }
                }
                .aspectRatio(1, contentMode: .fill)
                Spacer()
                    .frame(height: 60) // tabbarheight
            }
            .padding(17)
        }
        .navigationBarHidden(true)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView(viewRouter: ViewRouter())
    }
}
