//
//  NewsNavigationView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct NewsNavigationView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var navigationController = NavigationRouter()
    @ObservedObject var viewModel = NewsListViewModel()
    
    @State var isEditing: Bool = false
    @State var editingEnabled: Bool = false
    
    @State var isLoading: Bool = false
    @State var successPopup: Bool = false
    @State var failurePopup: Bool = false
    
    @State var showConfirmation: Bool = false
    
    @State var selectedNewsItem: NewsItem?
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Nieuws 🗞")
                    .themedFont(name: .extraBold, size: .large)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                    .padding(.leading, 17)
                    .foregroundColor(SystemColors.backgroundText)
                
                
                Toggle(isOn: $isEditing.animation(.spring())) {
                    Text("Wijzig")
                        .themedFont(name: .semiBold, size: .small)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                .padding(.trailing, 17)
                
                
                
                if !viewModel.isLoading {
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.newsList, id: \.self) { newsItem in
                            
                            HStack {
                                Button {
                                    
                                    withAnimation {
                                        navigationController.addAndPresent(AnyView(NewsDetailView(newsTitle: newsItem.title, content: newsItem.content, date: newsItem
                                                                                                    .createdAt, image: newsItem.image)))
                                        navigationController.present()
                                        viewRouter.isPresenting = true
                                    }
                                } label: {
                                    NewsRepeatableView(newsItem: newsItem)
                                        .padding(.trailing, 17)
                                        .padding(.leading, 17)
                                }
                                if isEditing {
                                    HStack(spacing: 17) {
                                        Button {
                                            // edit item
                                            
                                            withAnimation {
                                                Log.debug("newsItem to edit \(newsItem)")
                                                navigationController.addAndPresent(AnyView(UpdateNewsArticleView(viewRouter: viewRouter, navigation: navigationController, newsItem: newsItem)))
                                                navigationController.present()
                                                viewRouter.isPresenting = true
                                            }
                                        } label: {
                                            ZStack {
                                                Color.blue
                                                    .frame(width: 40, height: 40, alignment: .center)
                                                    .cornerRadius(100)
                                                
                                                VStack(spacing: 0) {
                                                    Image(systemName: "pencil.slash")
                                                        .resizable()
                                                        .foregroundColor(Color.white)
                                                        .frame(width: 20, height: 20, alignment: .center)
                                                        .foregroundColor(SystemColors.backgroundText)
                                                }
                                            }
                                        }
                                        
                                        Button {
                                            // delete item
                                            selectedNewsItem = newsItem
                                            
                                            showConfirmation = true
                                            
                                            
                                        } label: {
                                            ZStack {
                                                Color.red
                                                    .frame(width: 40, height: 40, alignment: .center)
                                                    .cornerRadius(100)
                                                
                                                VStack(spacing: 0) {
                                                    Image(systemName: "xmark")
                                                        .resizable()
                                                        .foregroundColor(Color.white)
                                                        .frame(width: 20, height: 20, alignment: .center)
                                                        .foregroundColor(SystemColors.backgroundText)
                                                }
                                            }
                                        }
                                    }
                                    .padding(.trailing, 17)
                                }
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
            .background(SystemColors.background)
            
            if !isEditing {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                navigationController.addAndPresent(AnyView(AddNewsArticleView(viewRouter: viewRouter, navigation: navigationController)))
                                navigationController.present()
                                viewRouter.isPresenting = true // for hiding the x mark
                            }
                            
                        } label: {
                            AddButtonView(systemName: "note.text.badge.plus")
                                .padding(30)
                        }
                    }
                }
            }
            
            NavigationsReturnableView(navigationViewRouter: navigationController, viewRouter: viewRouter) {
                navigationController.currentPresentedView
            }
            
            // Pop-ups
            
            if successPopup {
                CheckMarkAnimation()
            }
            
            if failurePopup {
                XmarkAnimation()
            }
            
        }
        .onAppear {
            viewRouter.isPresenting = false
        }
        
        .alert("Weet je het zeker dat je \(selectedNewsItem?.title ?? "") wilt verwijderen?", isPresented: $showConfirmation) {
            Button("Ja") {
                
                Api.News.deleteNewsPost(id: String(selectedNewsItem?.id ?? 0)) { result in
                    switch result {
                    case .success(let response):
                        Log.debug("Success deleting newsArticle \(response)")
                        
                        successPopup = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            successPopup = false
                            
                            withAnimation {
                                viewModel.reload()
                            }
                        }
                        
                    case .failure(let error):
                        Log.debug(error.localizedDescription)
                        
                        failurePopup = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            failurePopup = false
                        }
                    }
                }
            }
            
            Button("Annuleer") {
                showConfirmation = false
            }
        }
    }
}


struct NewsNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
