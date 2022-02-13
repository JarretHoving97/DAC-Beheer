//
//  NewsListModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 04/02/2022.
//

import SwiftUI

struct NewsListModel: Codable {
    let news: [NewsItem]
}

struct NewsItem: Codable, Hashable {
    let id: Int
    let title, content, createdAt: String
    var image: String?
    let updatedAt: String
}

extension NewsItem {
    var formattedDate: String {
        return createdAt.serverDateString(to: .simpleFormat)
    }
}

