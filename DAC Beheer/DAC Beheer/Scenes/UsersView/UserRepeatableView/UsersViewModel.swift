//
//  UsersViewModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 01/06/2022.
//

import Foundation


class UsersViewModel: ObservableObject, Identifiable {
    
    @Published var users: [UserModel] = []
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        Api.Users.getAllUser { [weak self] result in
            switch result {
            case .success(let data):
                self?.users = data.users
                Log.debug(data.users.description)
            case .failure(let error):
                Log.debug("error getting users \(error.localizedDescription)")
            }
        }
    }
}
