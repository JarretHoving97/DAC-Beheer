//
//  NewEventViewModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 26/02/2022.
//

import SwiftUI
import Alamofire

class NewEventViewModel: ObservableObject {
    
    @Published var eventTitle: String = ""
    @Published var eventRegisterFromDate: Date = Date()
    @Published var eventRegisterTilldate: Date = Date()
    @Published var eventDate: Date = Date()
    @Published var eventContent: String = ""
    @Published var membersOnly: Bool = false
    
    @Published var image: Image?
    @Published var inputImage: UIImage?
    
    @Published var showError: Bool = false
    @Published var showSucces: Bool = false
    
    //MARK: FUNCTIONS
    
    func datesAreValid() -> Bool {
        if eventRegisterTilldate < eventRegisterFromDate {
            Log.debug("Register till date = lower then register from date. Thats not allowed")
            return false
        }
        
        if eventDate < eventRegisterTilldate || eventDate < eventRegisterFromDate {
            Log.debug("Event date must be later than registrations.")
            return false
        }
        
        return true
    }
    
     func createParameters() -> Parameters? {
         
         if !datesAreValid() { return nil }
         
        let satisfied = [eventTitle, eventContent].allSatisfy {$0 != ""}
         
        switch satisfied {
        case true:
            return [
                "title": eventTitle,
                "content": eventContent,
                "register_from": eventRegisterFromDate.toServerDateString(),
                "register_till": eventRegisterTilldate.toServerDateString(),
                "members_only": membersOnly,
                "event_date": eventDate
            ]
        case false:
            Log.debug("Could not make parameters for create event request.")
            return nil
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

