//
//  NewRegistrant.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import Foundation

struct NewRegistrant: Codable, Hashable {
    let id: String?
    let firstName: String?
    let lastName: String?
    let verified: Bool?
    let phone: String?
    let role: String?
    let membershipNumber: String?
    let createdAt: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case id, createdAt, role
        case firstName = "first_name"
        case lastName = "last_name"
        case verified = "is_verified"
        case phone = "phone_number"
        case membershipNumber = "membership_number"
    }
    
    var fullName: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }
    
    var date: String {
        return createdAt?.serverDateString(to: .elegant) ?? ""
    }
}
