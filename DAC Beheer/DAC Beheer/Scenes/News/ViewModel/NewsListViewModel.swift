//
//  NewsListViewModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 04/02/2022.
//

import Foundation
import SwiftUI


class NewsListViewModel: ObservableObject {
    
    @Published var newsData: NewsListModel? {
        didSet {
            guard let news = newsData?.news else { return }
            self.newsList = news
        }
    }
    
    @Published private(set) var newsList = [NewsItem]()
    
    @Published var isLoading = false
    
    var hasData: Bool {
        return newsData != nil
    }
    
    init() {
        getCurrentNewsArticles()
    }
    
    private func getCurrentNewsArticles() {
        isLoading = true
        Api.News.getNewsPost { [weak self] result in
                
            switch result {
              
            case .success(let result):
                self?.newsData = result
                
            case .failure(let error):
                Log.debug("error fetching newsData \(error.localizedDescription)")
            }
            
            self?.isLoading = false
        }
    }
    
    func reload() {
        getCurrentNewsArticles()
    }
}
