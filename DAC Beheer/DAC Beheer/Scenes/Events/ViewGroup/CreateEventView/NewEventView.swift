//
//  NewEventView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 26/02/2022.
//

import SwiftUI

struct NewEventView: View {
    
    @ObservedObject var viewModel = NewEventViewModel()
    var navigation: NavigationRouter
    var viewRouter: ViewRouter
    
    @State private var showingImagePicker = false
    
     private var pageTitle: String {
        return viewModel.useState == .editing ? "Wijzig evenement" : "Nieuw evenement"
     }
    
    private var buttonTitle: String {
        return viewModel.useState == .editing ? "Wijzig" : "Verstuur"
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(pageTitle)
                    .themedFont(name: .extraBold, size: .large)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                    .padding(.leading, 17)
                    .foregroundColor(SystemColors.backgroundText)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        //image
                        Text("Foto(s)")
                            .themedFont(name: .bold, size: .title)
                            .foregroundColor(SystemColors.backgroundText)
                        
                        ZStack {
                            SystemColors.JTextField.textFieldBackground
                            
                            Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 60, height: 46, alignment: .center)
                                .foregroundColor(SystemColors.backgroundText)
                            VStack {
                                viewModel.image?
                                    .resizable()
                                    .scaledToFit()
                                
                            }
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 34, alignment: .center)
                        .frame(minHeight: 200)
                        .cornerRadius(10)
                        
                        .onTapGesture {
                            showingImagePicker = true
                        }
                        
                        JTextFieldView(title: "Titel", fieldType: .regular, text: $viewModel.eventTitle)
            
                        DatePicker("Evenement datum", selection: $viewModel.eventDate)
                            .themedFont(name: .bold, size: .regular)
                            .tint(SystemColors.theme1)
                            .foregroundColor(SystemColors.backgroundText)
                            .accentColor(SystemColors.backgroundText)
                           
                        
                        DatePicker("Inschrijven vanaf", selection: $viewModel.eventRegisterFromDate)
                            .themedFont(name: .bold, size: .regular)
                            .tint(SystemColors.theme1)
                            .foregroundColor(SystemColors.backgroundText)
                            .accentColor(SystemColors.backgroundText)
                        
                        
                        DatePicker("Inschrijven tot", selection: $viewModel.eventRegisterTilldate)
                            .themedFont(name: .bold, size: .regular)
                            .tint(SystemColors.theme1)
                            .foregroundColor(SystemColors.backgroundText)
                            .accentColor(SystemColors.backgroundText)
                        
                  
                        Toggle(isOn: $viewModel.membersOnly) {
                            Text("Alleen voor leden")
                                .themedFont(name: .semiBold, size: .title)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(SystemColors.backgroundText)
                        }
                        .tint(SystemColors.backgroundText)
                        
        
                        VStack {
                            JTextView(title: "Omschrijving", text: $viewModel.eventContent, isSelected: false)
                        }
                        
                        Button {
                            // send
                            
                            viewModel.createNewEvent { result in
                                switch result {
                                case .success(let response):
                                    Log.debug("success posting event!! \(response.message ?? "")")
                                    viewModel.showSucces = true
                                    
                                    
                                    withAnimation(Animation.easeOut(duration: 0.22).delay(1.2)) {
                                        navigation.close()
                                        viewRouter.isPresenting = false // for showing the previous xmark
                                    }
                                
                                case .failure(_):
                                    viewModel.showError = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        viewModel.showError = false
                                    }
                                }
                            }
                        } label: {
                            ZStack {
                                SystemColors.theme1
                                    .cornerRadius(5)
                                    .frame(height: 60, alignment: .center)
                                    .padding(.leading, 17)
                                    .padding(.trailing, 17)
                                    .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                                
                                Text(buttonTitle)
                                    .themedFont(name: .extraBold, size: .largeValutaSub)
                                    .foregroundColor(SystemColors.itemTextColor)
                            }
                            .padding(.top, 20)
                        }
                    }
                    .padding(17)
                }
            }
            .onChange(of: viewModel.inputImage) { _ in
                withAnimation {
                    viewModel.loadImage()
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
            
            if viewModel.showSucces {
                CheckMarkAnimation()
            }
            
            if viewModel.showError {
                XmarkAnimation()
            }
        }
        .background(SystemColors.background)
    
    }
    
    func setEvent(_ event: Event) {
        viewModel.event = event
    }
}

//struct NewEventView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewEventView()
//    }
//}
