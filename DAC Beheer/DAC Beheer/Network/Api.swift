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

extension Api {
    
    struct Generic {
        static func regularResponseCall(req: Router, completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
            AF.request(req).responseDecodable { (response: DataResponse<SuccessResponse, AFError>) in
                completion(response.result)
            }
        }
    }
}

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
        
        // approve user
        static func verifyUser(id: String, completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
            AF.request(Router.verifyRegistrant(id: id)).responseDecodable { (response: DataResponse<SuccessResponse, AFError>) in
                completion(response.result)
            }
        }
        
        // delete user
        static func deleteUser(id: String, completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
            AF.request(Router.deleteReigstrant(id: id)).responseDecodable { (response: DataResponse<SuccessResponse, AFError>) in
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
        
        // upload news article with image
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
        
        static func updateNewsArticle(title: String, content: String, image: UIImage? = nil, id: Int,  completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {

            
            let parameters: Parameters = [
                "title": title,
                "content": content
            ]
            
            let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                "Content-type": "multipart/form-data"
            ]
            
            let url = "\(NetworkEnvironment.current.rawValue)/news/update/\(id)"
            
            Log.debug("url: \(url)")
            
            AF.upload(multipartFormData: { multipartFormData in
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key as String)
                }
                
                // add image to header
                if let image = image, let imageData = image.jpegData(compressionQuality: 0.8) {
                    
                    multipartFormData.append(imageData, withName: "image", fileName: "newsImage.png", mimeType: "image/png")
                }
                
            }, to: url, method: .patch, headers: headers)
                .responseDecodable { (response: DataResponse<SuccessResponse, AFError>) in
                    completion(response.result)
                }
        }
    }
}

// MARK: - EVENT
extension Api {
    struct Events {
        static func getAllEvents(completion: @escaping (Result<[Event], AFError>) -> Void) {
            
            AF.request(Router.getAllEvents).responseDecodable { (response: DataResponse<[Event], AFError>) in
                
                completion(response.result)
            }
        }
    }
}
