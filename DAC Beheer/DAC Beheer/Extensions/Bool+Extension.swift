//
//  Bool+Extension.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 15/04/2022.
//

import Foundation

extension Bool {
    func localized() -> String {
        if self == true {
            return "Ja"
        } else {
            return "Nee"
        }
    }
}
