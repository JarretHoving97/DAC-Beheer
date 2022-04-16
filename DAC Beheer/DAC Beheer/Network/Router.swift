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
    case getNewRegistrants
    case verifyRegistrant(id: String)
    case deleteReigstrant(id: String)
    
    // MARK: - News
    /*
     Upload calls add and update are handled in the function it self
     See Api class.
     */
    case getNewsArticles(itemsPerPage: Int, currentPage: Int)
    case deleteNewsArticle(id: String)
    case getRegistrantsForEvent(_ id: String)
    
    //MARK: - EVENT
    case getAllEvents
    case deleteEvent(id: String)

    
    // MARK: - ADMIN USER
    case login
    
    var baseUrl: String {
        return NetworkEnvironment.current.rawValue
    }
    
    static var mediaUrl: String {
        var base = NetworkEnvironment.current.rawValue
        base.removeLast(6)
        return "\(base)/image"
    }
    
    var urlExtension: String {
        switch self {
            
            // MARK: USERS
        case .getNewRegistrants:
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
        case .deleteNewsArticle(id: let id):
            return "news/delete/\(id)"
            
            // MARK: EVENT
        case .getAllEvents:
            return "event/all"
            
        case .getRegistrantsForEvent(let id):
            return "event/registers/\(id)"
            
        case .deleteEvent(id: let id):
            return "event/delete/\(id)"
    
        }
    }
    
    var parameters: Parameters {
        
        switch self {
      
        default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
            // MARK: - USERS
        case .getNewRegistrants, .getAllEvents:
            return .get
            
        case .verifyRegistrant:
            return .patch
            
        case .deleteReigstrant, .deleteNewsArticle, .deleteEvent:
            return .delete
            
            // MARK: - NEWS
        case .getNewsArticles:
            return .get
        
            // MARK: - EVENT
        case .getRegistrantsForEvent:
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
        
        Log.debug("sending request \(urlRequest)")
        return urlRequest
    }
    
}
