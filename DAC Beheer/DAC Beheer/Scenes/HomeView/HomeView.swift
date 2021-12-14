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
        GridItem(.flexible()),
        GridItem(.flexible())
     
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                HStack {
                    HomeHeaderView()
                        .frame(height: 237, alignment: .center)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                    }
                .padding(.bottom, 21)
                
                LazyVGrid(columns: columns, spacing: 21) {
                    ForEach(TabMenu.menuItems, id: \.self) { item in
                        let model = TabMenu.getButtonForItem(option: item)
                        MenuButtonsViewModel(model: model)
                            .frame(maxWidth: 169,  maxHeight: 153,   alignment: .center)
                            .aspectRatio(1, contentMode: .fill)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                    }
                }
                .aspectRatio(1, contentMode: .fill)
            }
            .padding(17)

        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
