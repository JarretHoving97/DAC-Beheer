//
//  Log.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 06/02/2022.
//

import Foundation



/// Logging class
///
/// Prints out only when debugmode is enabled.
class Log {
    
    static func debug(_ message: String) {
        #if DEBUG
        print("")
        print("👨🏽‍💻 - \(message)")
        print("")
        #endif
    }
}

