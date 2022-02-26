//
//  EventViewModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 24/02/2022.
//

import Foundation
import SwiftUI

class EventViewModel: ObservableObject {
    
    private(set) var eventList: [Event] = []
    
    @Published var isLoading = false
    @Published var isEditing = false
    
    @Published var showSucces = false
    @Published var showError = false
    @Published var showAlert = false
    
    @Published var selectedEvent: Event?
    
    init() {
        getAllEvents()
    }
    
    private func getAllEvents() {
        isLoading = true
        
        Api.Events.getAllEvents { [weak self] result in
            switch result {
            case .success(let events):
                self?.eventList = events
            case .failure(let error):
                Log.debug("Error getting eventrs: \(error.localizedDescription)")
            }
            
            self?.isLoading = false
        }
    }
    
    func reload() {
        getAllEvents()
    }
}
