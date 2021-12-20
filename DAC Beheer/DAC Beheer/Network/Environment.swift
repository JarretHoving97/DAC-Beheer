//
//  Environment.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation

enum BaseUrl: String {
    case local = "http://localhost:8080/dashboard"
}

struct NetworkEnvironment {
    static let current: BaseUrl = .local
}


