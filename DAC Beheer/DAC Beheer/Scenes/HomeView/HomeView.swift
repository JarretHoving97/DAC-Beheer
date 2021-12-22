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
                HStack {
                    HomeHeaderView()
                        .frame(height: 237, alignment: .center)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                }
                .padding(.bottom, 21)
                
                LazyVGrid(columns: columns, spacing: 21) {
                    ForEach(MenuModel.menuItems, id: \.self) { item in
                        let model = MenuModel.getButtonForItem(option: item)
                        Button {
                            withAnimation {
                                viewRouter.popOverPages = item
                            }
                        } label: {
                            MenuButtonsViewModel(model: model)
                                .frame(maxWidth: 169,  maxHeight: 153,   alignment: .center)
                                .aspectRatio(1, contentMode: .fill)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                        }
                    }
                }
                .aspectRatio(1, contentMode: .fill)
                Spacer()
                    .frame(height: 60) // tabbarheight
            }
            .padding(17)
        }
        .navigationBarHidden(true)
        .foregroundColor(SystemColors.theme1)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView(viewRouter: ViewRouter())
    }
}
