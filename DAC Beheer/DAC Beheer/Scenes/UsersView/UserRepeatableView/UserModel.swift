//
//  UserModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import Foundation

struct UserModel {
    
    let firstName: String
    let lastName: String

    let team: String?
    let function: String?
}

extension UserModel {
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
}



