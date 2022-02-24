//
//  Event.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 24/02/2022.
//

import Foundation

struct Event: Codable, Hashable {
    let id: Int
    var title: String
    var content: String
    var image: String?
    var registerFrom: String
    var registerTill: String
    var eventDate: String
    var membersOnly: Bool
    var cancelled: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, title, content, image, cancelled
        case registerTill = "register_till"
        case registerFrom = "register_from"
        case membersOnly = "members_only"
        case eventDate = "event_date"
    }
}

extension Event {
    var registerFromFormatted: String {
        return registerFrom.serverDateString(to: .elegant)
    }
    
    var registerTillFormatted: String {
        return registerTill.serverDateString(to: .elegant)
    }
    
    var eventDateFormatted: String {
        return eventDate.serverDateString(to: .elegant)
    }
}
