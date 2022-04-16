//
//  NewEventViewModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 26/02/2022.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI
import UIKit

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
    
    var delegate: NavigationReturnable?
    
    @Published var useState: useState = .create
    
    @Published var event: Event? {
        didSet {
            useState = .editing
            eventTitle = event?.title ?? ""
            eventRegisterFromDate = event?.registerFrom.toDate(dateFormat: .serverDate) ?? Date()
            eventRegisterTilldate = event?.registerTill.toDate(dateFormat: .serverDate) ?? Date()
            eventDate = event?.eventDate.toDate(dateFormat: .serverDate) ?? Date()
            membersOnly = event?.membersOnly ?? false
            eventContent = event?.content ?? ""
            
            // download image
            SDWebImageManager.shared.loadImage(with: WebImageHelper.imageUrl(event?.image), progress: nil) { [weak self] img, _, err, _, _, _ in
                
                if let error = err {
                    Log.debug("Could not download Image: \(error.localizedDescription)")
                    return
                }
                
                guard let downloadedImage = img else {
                    return
                }
                self?.image = Image(uiImage: img ?? UIImage())
                self?.inputImage = downloadedImage
            }
        }
    }
    
    lazy var defaultResponseHandler: ((DefaultResponse) -> Void) = { [weak self] result in
        switch result {
        case .success(let response):
            Log.debug("success posting event!! \(response.message ?? "")")
            self?.showSucces = true
        
            withAnimation(Animation.easeOut(duration: 0.22).delay(1.2)) {
                self?.delegate?.presentationDidEnd()
            }
        
        case .failure(_):
            self?.showError = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self?.showError = false
            }
        }
    }

    // Network call
    func createNewEvent(completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
        guard let parameters = createParameters() else { return }
        Api.Events.sendEvent(parameters: parameters, completion: completion)
    }
    
    func updateEvent(event: Event, completion: @escaping (Result<SuccessResponse, AFError>) -> Void) {
        guard let parameters = createParameters() else { return }
        Api.Events.updateEvent(parameters: parameters, id: event.id, completion: completion)
    }
    
    //MARK: FUNCTIONS
    func datesAreValid() -> Bool {
        if eventRegisterTilldate < eventRegisterFromDate {
            Log.debug("Register till date is lower then register from date. Thats not allowed")
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
