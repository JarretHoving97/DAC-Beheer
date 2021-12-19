//
//  UserModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import Foundation

let json = """

[
  {
    "firstName": "Jarret",
    "lastName": "Hoving",
    "team": "H1",
    "function": "Technische dienstverlener"
  },
  {
    "firstName": "Jarret",
    "lastName": "Hoving",
    "team": "H1",
    "function": "Technische dienstverlener"
  },

  {
    "firstName": "Jarret",
    "lastName": "Hoving",
    "team": "H1",
    "function": "Technische dienstverlener"
  },

  {
    "firstName": "Jarret",
    "lastName": "Hoving",
    "team": "H1",
    "function": "Technische dienstverlener"
  }
]

"""

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



