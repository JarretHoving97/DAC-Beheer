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
    @Published var eventRegisterFromDate: String = ""
    @Published var eventRegisterTilldate: String = ""
    @Published var eventDate: String = ""
    @Published var eventContent: String = ""
    @Published var membersOnly: Bool = false
    
    @Published var image: Image?
    @Published var inputImage: UIImage?
    
    /*
     TODO: - ADD VALIDATION
     
     */
    
    
    //MARK: FUNCTIONS
    
    private func parameters() -> Parameters {
        
       let satisfied = [eventTitle, eventRegisterFromDate, eventRegisterTilldate, eventDate, eventContent].allSatisfy {$0 != ""}
        
        switch satisfied {
        case true:
            return [
                "title": eventTitle,
                "content": eventContent,
                "register_from": eventRegisterFromDate,
                "register_till": eventRegisterTilldate,
                "members_only": membersOnly,
                "event_date": eventDate
            ]
        case false:
            Log.debug("Could not make parameters for create event request.")
            return [:]
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}
