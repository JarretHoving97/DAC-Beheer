//
//  SwiftUIView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 09/12/2021.
//

import SwiftUI
//
struct HomeView: View {
    @State var selectedTab = 1
    @StateObject var viewRouter = ViewRouer()
    
    var items: [GridItem] {
        Array(repeating: .init(.flexible()), count: TabMenu.menuItems.count)
    }
    var columns = [
        GridItem(.flexible(minimum: 20))
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                HomeHeaderView()
                    .frame(height: 237, alignment: .center)
                    .cornerRadius(20)
                    .padding(17)
            }
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(TabMenu.menuItems, id: \.self) { item in
                    let model = TabMenu.getButtonForItem(option: item)
                    MenuButtonsViewModel(model: model)
                }
                .padding(.horizontal)
          
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
