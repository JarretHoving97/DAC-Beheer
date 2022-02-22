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
import AVFoundation

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
            AF.request(Router.getNewsArticles(itemsPerPage: 14, currentPage: 1)).responseDecodable { (response: DataResponse<NewsListModel, AFError>) in
                completion(response.result)
            }
        }
        
        static func deleteNewsPost(id: String, completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
            AF.request(Router.deleteNewsArticle(id: id)).responseDecodable { (response: DataResponse<SuccessResponse, AFError>) in
                completion(response.result)
            }
        }
        
        static func postNewsArticle(title: String, content: String, image: UIImage? = nil,  completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
            
            let parameters: Parameters = [
                "title": title,
                "content": content
            ]
            
            let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                "Content-type": "multipart/form-data"
            ]
            
            let url = "\(NetworkEnvironment.current.rawValue)/news/add"
            
    
                AF.upload(multipartFormData: { multipartFormData in
                    for (key, value) in parameters {
                        multipartFormData.append("\(value)".data(using: .utf8)!, withName: key as String)
                    }
                    
                    // add image to header
                    if let image = image, let imageData = image.jpegData(compressionQuality: 0.8) {
                        
                        multipartFormData.append(imageData, withName: "image", fileName: "newsImage.png", mimeType: "image/png")
                    }
            
                }, to: url, method: .post, headers: headers)
                    .responseDecodable { (response: DataResponse<SuccessResponse, AFError>) in
                        completion(response.result)
                    }

            
        }
    }
}
