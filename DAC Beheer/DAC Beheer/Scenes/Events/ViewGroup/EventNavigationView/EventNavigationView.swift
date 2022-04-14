//
//  EventNavigationView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct EventNavigationView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var navigationController = NavigationRouter()
    
    @State private var searchText = ""
    
    @ObservedObject var viewModel = EventViewModel()
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Evenementen 📆")
                    .themedFont(name: .extraBold, size: .large)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                    .padding(.leading, 17)
                    .foregroundColor(SystemColors.backgroundText)
                
                Toggle(isOn: $viewModel.isEditing.animation(.spring())) {
                    Text("Wijzig")
                        .themedFont(name: .semiBold, size: .small)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                .padding(.trailing, 17)
                
                
                ScrollView {
                    if !viewModel.isLoading {
                        ForEach(viewModel.eventList, id: \.self) { event in
                            HStack {
                                Button {
                                    
                                    withAnimation {
                                        navigationController.addAndPresent(AnyView(EventOverViewView(event: event)))
                                        
                                        navigationController.present()
                                        viewRouter.isPresenting = true
                                    }
                                    
                                } label: {
                                    EventView(event: event)
                                        .padding(.trailing, 17)
                                        .padding(.leading, 17)
                                }
                                if viewModel.isEditing {
                                    HStack(spacing: 17) {
                                        Button {
                                            // edit item
                                            withAnimation {
                                                let eventView = NewEventView(navigation: navigationController, viewRouter: viewRouter)
                                                eventView.setEvent(event)  // set event and the program knows it needs to edit instead )
                                                navigationController.addAndPresent(AnyView(eventView))
                                                
                                                navigationController.present()
                                                viewRouter.isPresenting = true
                                            }
                                        } label: {
                                            ZStack {
                                                Color.blue
                                                    .frame(width: 40, height: 40, alignment: .center)
                                                    .cornerRadius(100)
                                                
                                                VStack(spacing: 0) {
                                                    Image(systemName: "square.and.pencil")
                                                        .resizable()
                                                        .foregroundColor(Color.white)
                                                        .padding(.leading, 2)
                                                        .padding(.bottom, 2)
                                                        .frame(width: 20, height: 20, alignment: .center)
                                                        .foregroundColor(SystemColors.backgroundText)
                                                }
                                            }
                                        }
                                        
                                        Button {
                                            // delete item
                                            viewModel.showAlert = true
                                            viewModel.selectedEvent = event
                                            
                                        } label: {
                                            ZStack {
                                                Color.red
                                                    .frame(width: 40, height: 40, alignment: .center)
                                                    .cornerRadius(100)
                                                
                                                VStack(spacing: 0) {
                                                    Image(systemName: "xmark")
                                                        .resizable()
                                                        .foregroundColor(Color.white)
                                                        .frame(width: 20, height: 20, alignment: .center)
                                                        .foregroundColor(SystemColors.backgroundText)
                                                }
                                            }
                                        }
                                    }
                                    .padding(.trailing, 17)
                                }
                            }
                        }
                    }
                }
                .alert("Weet je het zeker dat je \(viewModel.selectedEvent?.title ?? "") wilt verwijderen?", isPresented: $viewModel.showAlert) {
                    Button("Ja") {
                        
                        Api.Generic.regularResponseCall(req: .deleteEvent(id: String(viewModel.selectedEvent?.id ?? 0))) { result in
                            switch result {
                            case .success(_):
                                viewModel.showSucces = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    viewModel.showSucces = false
                                    viewModel.reload()
                                }
                                
                            case .failure(let error):
                                Log.debug(error.localizedDescription)
                                
                                viewModel.showError = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    viewModel.showError = false
                                   
                                }
                            }
                        }
                    }
                    Button("Annuleer") {
                        viewModel.showAlert = false
                    }
                }
            }
            .background(SystemColors.background)
            
            if !viewModel.isEditing {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                navigationController.addAndPresent(AnyView(NewEventView(navigation: navigationController, viewRouter: viewRouter)))
                                navigationController.present()
                                viewRouter.isPresenting = true // for hiding the x mark
                            }
                            
                        } label: {
                            AddButtonView(systemName: "plus")
                                .padding(30)
                        }
                    }
                }
            }
            
            NavigationsReturnableView(navigationViewRouter: navigationController, viewRouter: viewRouter) {
                navigationController.currentPresentedView
            }
        }
        
        if viewModel.showSucces {
            CheckMarkAnimation()
        }
        
        if viewModel.showError {
            XmarkAnimation()
        }
    }
}

