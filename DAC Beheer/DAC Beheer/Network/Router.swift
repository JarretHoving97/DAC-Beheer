//
//  Router.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation
import Alamofire
import CoreVideo

enum EndpointType {
    case app
    case dashboard
    
    
}

enum Router: URLRequestConvertible {
    
    // MARK: - USERS
    case getNewRegistrant
    case verifyRegistrant(id: String)
    case deleteReigstrant(id: String)
    
    // MARK: - News
    case postNewsArticle(content: NewsPost)
    case getNewsArticles(itemsPerPage: Int, currentPage: Int)
    case deleteNewsArticle(id: String)
    
    case login
    
    var baseUrl: String {
        return NetworkEnvironment.current.rawValue
    }
    
    var urlExtension: String {
        switch self {
            
            // MARK: USERS
        case .getNewRegistrant:
            return "verify/registrations"
        case .verifyRegistrant(id: let id):
            return "verify/appuser/\(id)"
        case .deleteReigstrant(id: let id):
            return "verify/registrations/\(id)"
        case .login:
            return "admin/login"
            
            // MARK: NEWS
        case .getNewsArticles(itemsPerPage: let pageCount, currentPage: let page):
            return "news/all/pageCount/\(pageCount)/page/\(page)"
        case .postNewsArticle:
            return "news/add"
        case .deleteNewsArticle(id: let id):
            return "news/delete/\(id)"
        }
    }
    
    var parameters: Parameters {
        
        switch self {
        case .postNewsArticle(content: let post):
            return ["title": post.title, "content": post.content]
        default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
            // MARK: - USERS
        case .getNewRegistrant:
            return .get
            
        case .verifyRegistrant:
            return .put
            
        case .deleteReigstrant, .deleteNewsArticle:
            return .delete
            
            // MARK: - NEWS
        case .getNewsArticles:
            return .get
            
            
        default:
            ///Post request are propably
            ///the most common. If not, change it to make the code easier
            return .post
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url: URL = try baseUrl.asURL().appendingPathComponent(urlExtension)
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        return urlRequest
    }
    
}
