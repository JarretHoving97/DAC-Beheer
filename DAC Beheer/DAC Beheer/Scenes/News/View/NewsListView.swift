//
//  NewsListView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 06/02/2022.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = NewsListViewModel()
    @StateObject var navigationView: NavigationRouter
    
    var body: some View {
        if !viewModel.isLoading {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.newsList, id: \.self) { newsItem in
                    Button {
                        
                        withAnimation {
                            navigationView.addAndPresent(AnyView(NewsDetailView(newsTitle: newsItem.title, content: newsItem.content, date: newsItem
                                                                                    .createdAt)))
                            navigationView.present()
                            viewRouter.isPresenting = true
                        }
                    } label: {
                        NewsRepeatableView(newsItem: newsItem)
                    }
                }
                Spacer()
            }
            .background(SystemColors.background)
        } else {
            Spacer()
            ActivityIndicatorView()
                .frame(width: 100, height: 100)
                .foregroundColor(SystemColors.backgroundText)
            Spacer()
        }
    }
}
