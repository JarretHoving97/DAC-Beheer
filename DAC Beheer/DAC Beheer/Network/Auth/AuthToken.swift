//
//  AuthToken.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 20/12/2021.
//

import Foundation

struct AuthToken: Decodable {
    var accestoken: String
    var refreshToken: String 
}
