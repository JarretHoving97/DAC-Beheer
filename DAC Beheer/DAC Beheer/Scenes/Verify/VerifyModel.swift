//
//  VerifyModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import Foundation
import SwiftUI

class VerifyModel: ObservableObject {
    
    @Published var registrants = [NewRegistrant]()
    
    init() {
        getRegistrants()
    }
    
    private func getRegistrants() {
        Api.getNewRegistrants {[weak self] result in
            switch result {
            case .success(let result):
                self?.registrants = result
    
            case .failure(let error):
                print("error fetching users \(error.localizedDescription)")
            }
        }
    }
}
