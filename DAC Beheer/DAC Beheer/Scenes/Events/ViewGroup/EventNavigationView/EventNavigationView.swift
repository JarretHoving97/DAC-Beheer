//
//  EventNavigationView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct EventNavigationView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var navigationRouter = NavigationRouter()
    
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
                                        let eventOverView = AnyView(EventOverViewView(event: event))
                                        presentNextView(eventOverView)
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
                                                let eventView = NewEventView(navigationRouter: navigationRouter, viewRouter: viewRouter)
                                                eventView.setEvent(event)  // set event and the program knows it needs to edit instead )
                                                navigationRouter.addAndPresent(AnyView(eventView))
                                                
                                                navigationRouter.present()
                                                viewRouter.isPresenting = true
                                            }
                                        } label: {
                                            EditItemButtonView()
                                        }
                                        
                                        Button {
                                            // delete item
                                            viewModel.showAlert = true
                                            viewModel.selectedEvent = event
                                            
                                        } label: {
                                            DeleteItemView()
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
                                let view = AnyView(NewEventView(navigationRouter: navigationRouter, viewRouter: viewRouter))
                                presentNextView(view)
                            }
                            
                        } label: {
                            AddButtonView(systemName: "plus")
                                .padding(30)
                        }
                    }
                }
            }
            
            NavigationsReturnableView(navigationViewRouter: navigationRouter, viewRouter: viewRouter) {
                navigationRouter.currentPresentedView
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

extension EventNavigationView: NavigationReturnable {
    
    func presentNextView(_ view: AnyView) {
        navigationRouter.addAndPresent(view)
        navigationRouter.present()
        viewRouter.isPresenting = true
    }
    
    func presentationDidEnd() {
        navigationRouter.close()
    }
}
