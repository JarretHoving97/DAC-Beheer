//
//  Session+Extension.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation
import Alamofire

extension Session {
    
    static let admin = {
        let configuration = createApiConfiguration()
    }
    
    
    /// Api SessionManager configuration - Uses the default http headers with the required killswitch headers and disables cookie usage.
    private static func createApiConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.httpCookieAcceptPolicy = .never
        configuration.httpCookieStorage = nil
        return configuration
    }
}

extension URLSession {
    
    static let adminSession: URLSession = {
        let coniguration = createApiConfiguration()
    
        //TODO: Create elegant way to add bearer token
        let sessionManager = URLSession(configuration: coniguration, delegate: .none, delegateQueue: .main)
        
        
        return sessionManager
    }()
    
    
    private static func createApiConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.httpCookieAcceptPolicy = .never
        configuration.httpCookieStorage = nil
        return configuration
    }
    
}
