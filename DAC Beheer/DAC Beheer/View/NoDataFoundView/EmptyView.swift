//
//  EmptyView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import Foundation
import UIKit

struct NoContentModel {
    
    enum EmptyEmoji: Int {
        case wizard = 0
        case shite = 1
        case shrug = 2
        case ninja = 3
        case mailBox = 4
    }
    
    static var randomInt: Int {
        return Int.random(in: 0...5)
    }
}

extension NoContentModel {
    
    static func getEmoji(for value: Int) -> String {
         switch value {
         case 0:
             return "🧙🏼‍♂️"
         case 1:
             return "💩"
         case 2:
             return "🤷🏼‍♂️"
         case 3:
             return "🥷"
         default:
             return "📭"
         }
     }
    
  static func returnRandomEmptyImage() -> UIImage {
      let int = randomInt
      let emoji = getEmoji(for: int)
      return emoji.image() ?? UIImage()
    }
}
