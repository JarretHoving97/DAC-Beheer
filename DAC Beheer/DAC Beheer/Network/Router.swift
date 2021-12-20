//
//  Router.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getNewRegistrant
    case verifyRegistrant(id: String)
    case deleteReigstrant(id: String)
    
    case login
    
    var baseUrl: String {
        return NetworkEnvironment.current.rawValue
    }
    
    var urlExtension: String {
        switch self {
        case .getNewRegistrant:
            return "/registrations"
        case .verifyRegistrant(id: let id):
            return "/appuser/\(id)"
        case .deleteReigstrant(id: let id):
            return "/registrations/\(id)"
        case .login:
            return "/admin/login"
        }
    }
        
    var method: HTTPMethod {
        switch self {
        case .getNewRegistrant:
            return .get
            
        case .verifyRegistrant:
            return .put
            
        case .deleteReigstrant:
            return .delete
            
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
  

        print(urlRequest)
        return urlRequest
    }

}
