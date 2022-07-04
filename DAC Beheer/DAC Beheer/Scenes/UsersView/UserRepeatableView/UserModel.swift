//
//  UserModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import Foundation

struct UsersResponse: Codable {
    let users: [UserModel]
}

struct UserModel: Codable, Hashable, Identifiable {
    
    let uuid = UUID()
    let id: String
    let firstName: String
    let lastName: String
    let phone: String
    let membershipNumber: String
    let createdAt: String
    let updatedAt: String
    let isVerified: Bool
  
    private enum CodingKeys: String, CodingKey {
        case id, createdAt, updatedAt
        case firstName = "first_name"
        case lastName = "last_name"
        case phone = "phone_number"
        case membershipNumber = "membership_number"
        case isVerified = "is_verified"
    }
}

extension UserModel {
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
}



