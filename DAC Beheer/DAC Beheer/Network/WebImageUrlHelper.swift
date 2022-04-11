//
//  WebImageUrlHelper.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 15/02/2022.
//

import Foundation
import SwiftUI

struct WebImageHelper {
    static let imageUrl =  Router.mediaUrl
    
    static func imageUrl(_ append: String?) -> URL? {
        
        let url = "\(imageUrl)/\(append ?? "")"
        Log.debug(url)
        return URL(string: url)
    }
}
