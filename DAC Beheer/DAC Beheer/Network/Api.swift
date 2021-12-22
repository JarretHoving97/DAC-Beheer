//
//  Api.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation
import Alamofire
import Network

struct Api {
    
    enum ApiError: Error {
           case invalidURL
           case missingData
       }
    
    static func fetchToken() async throws -> AuthToken {
        
        let session = URLSession.shared

        guard let urlRequest = try? Router.login.asURLRequest() else {
            throw ApiError.invalidURL
        }

        do {
            let (data, _) = try await session.data(for: urlRequest)
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(AuthToken.self, from: data)
        } catch {
            print(error.localizedDescription)
            throw ApiError.missingData
        }
    }
    
    
    static func getNewRegistrants(completion: @escaping (Result<[NewRegistrant], AFError>) -> Void) {
        AF.request(Router.getNewRegistrant).responseDecodable { (response: DataResponse<[NewRegistrant], AFError>) in
            completion(response.result)
        }
    }
}
