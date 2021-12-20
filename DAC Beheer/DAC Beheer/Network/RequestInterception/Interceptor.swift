//
//  Interceptor.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation
import Alamofire
import SwiftUI

extension Notification.Name {
    
    /**
     * Notification for when a the access token and refresh token are expired.
     */
    static let sessionExpired = Notification.Name("mope.sessionExpired")
}

enum RefreshTokenResult {
    
    /// Token is still refreshing
    case refreshing
    
    /// Token has been renewed
    case renewed(AuthToken)
    
    /// token was expired
    case expired
    
    /// nothing happend (netwok error)
    case none
}


class AuthRequestInterceptor: RequestInterceptor {
    
    private var result: RefreshTokenResult = .none
    private let dispatchGroup = DispatchGroup() ///new task
    private let dispatchQueue = DispatchQueue(label: "session.retrier") ///label the task to do on background
    
    private func setRefreshTokenResult(_ result: RefreshTokenResult) {
        switch self.result {
        case .refreshing:
            debugPrint("♻️♻️♻️ REFRESH TOKEN STATUS - REFRESHING")
        case .renewed(let authToken):
            debugPrint("♻️♻️♻️ REFRESH TOKEN STATUS - RENEWED")
            setAuthToken(authToken)
        case .expired:
            debugPrint("♻️♻️♻️ REFRESH TOKEN STATUS - EXPIRED")
            self.sessionExpired()
        case .none:
            debugPrint("♻️♻️♻️ REFRESH TOKEN STATUS - NONE")
        }
    }
    
    /// Trigger a session expired.
    public func sessionExpired() {
        NotificationCenter.default.post(name: .sessionExpired, object: nil)
    }
    
    func getAuthToken() -> AuthToken? {
        
        //TODO: add method to refresh the token
        return nil
    }
    
    /// Set the authToken, return true when request should be retried only!
    @discardableResult
    public func setAuthToken(_ : AuthToken?) -> Bool {
        
        //TODO set token in userdefaults or keychain or something
        return false
    }
    
}
