//
//  String+Extensions.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import Foundation
import UIKit

extension String {
    
    enum DateFormat: String {
        case serverDate = "yyyy-MM-dd'T'HH:mm:ssX"
        case elegant = "dd MMM. yyyy"
        case simpleFormat = "yyyy-MM-dd"
    }
    
    func toDate(dateFormat: DateFormat) -> Date {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dateFormat.rawValue
        let date = formatter.date(from: self) ?? Date()
        
        return date
    }
    
    func serverDateString(to format: DateFormat) -> String {
        let date = self.toDate(dateFormat: format)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format.rawValue
        let newDateString = formatter.string(from: date)
        return newDateString
    }
}

extension String {
    
    func image() -> UIImage? {
        let size = CGSize(width: 60, height: 60)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 60)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
