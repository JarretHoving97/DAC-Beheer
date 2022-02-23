//
//  Array+extension.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 04/02/2022.
//

import Foundation

extension Array {
    func contains<T>(obj: T) -> Bool where T: Equatable {
        return !self.filter({$0 as? T == obj}).isEmpty
    }
}
