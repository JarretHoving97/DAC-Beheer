//
//  Extension+Date.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import Foundation

extension Date {
    
    /// The start of the day
    public var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    /// The start of the next day
    public var startOfNextDay: Date {
        return startOfDay.addingTimeInterval(86400)
    }
    
    /// Returns a boolean if the date is in the past
    public var isInThePast: Bool {
        return Date() > self
    }
    
    /// Returns a boolean if the date is in the future
    public var isInTheFuture: Bool {
        return Date() < self
    }
    
    /// Returns a boolean if the date is yesterday
    public var isInYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    /// Returns a boolean if the date is today
    public var isInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    /// Returns a boolean if the date is tomorrow
    public var isInTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    public func adding(_ value: Int, _ component: Calendar.Component) -> Date? {
        return Calendar.current.date(byAdding: component, value: value, to: self)
    }
    
    public func isInSame(_ component: Calendar.Component, as date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: component)
    }
    
    public func isInThis(_ component: Calendar.Component) -> Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: component)
    }
}

extension Date {
    public func toServerDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.serverDate.rawValue
        
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        let dateString = formatter.string(from: self)
        
        return dateString
        
    }
}
