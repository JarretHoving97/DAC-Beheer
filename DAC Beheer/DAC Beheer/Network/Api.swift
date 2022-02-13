//
//  Api.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation
import Alamofire
import Network
import UIKit

struct Api {}

// MARK: - Token authentication calls here
extension Api {
    
    struct Token {
        
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
                Log.debug(error.localizedDescription)
                throw ApiError.missingData
            }
        }
    }
}
// MARK: - User verify calls here
extension Api {
    
    struct Verify {
        
        // get new registrants
        static func getNewRegistrants(completion: @escaping (Result<[NewRegistrant], AFError>) -> Void) {
            AF.request(Router.getNewRegistrant).responseDecodable { (response: DataResponse<[NewRegistrant], AFError>) in
                completion(response.result)
            }
        }
    }
}

// MARK: - News calls here
extension Api {
    
    struct News {
        static func getNewsPost(completion: @escaping (Result<NewsListModel, AFError>) -> Void) {
            AF.request(Router.getNewsArticles(itemsPerPage: 10, currentPage: 1)).responseDecodable { (response: DataResponse<NewsListModel, AFError>) in
                completion(response.result)
            }
        }
        
        static func postNewsArticle(title: String, content: String, image: UIImage? = nil,  completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
        
            let post = NewsPost(title: title, content: content)
            AF.request(Router.postNewsArticle(content: post)).responseDecodable { (response: DataResponse<SuccessResponse, AFError> ) in
                completion(response.result)
            }
        }
    }
}
