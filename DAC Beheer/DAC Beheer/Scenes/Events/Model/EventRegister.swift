//
//  EventRegister.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 10/03/2022.
//

import Foundation

struct EventRegister: Codable {
    let result: EventRegisterResult
}

struct EventRegisterResult: Codable {
    let result: [EventRegistration]
}

struct EventRegistration: Codable {
    let id: Int
    let bringsFriends: Bool?
    let userId: String?
    let eventId: Int?
    let registrant: Registrant
    
    private enum CodingKeys: String, CodingKey {
        case bringsFriends = "bring_friends"
        case userId = "user_id"
        case eventId = "event_id"
        case registrant = "app_user"
        case id
    }
}

struct Registrant: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let verified: Bool
    let phone: String
    let membershipNumber: String
    
    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case membershipNumber = "membership_number"
        case id, phone, verified
    }
}
