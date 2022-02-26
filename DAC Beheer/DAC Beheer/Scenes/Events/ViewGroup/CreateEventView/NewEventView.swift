//
//  NewEventView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 26/02/2022.
//

import SwiftUI

struct NewEventView: View {
    
    @ObservedObject var viewModel = NewEventViewModel()
    
    @State private var showingImagePicker = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Nieuw evenement")
                    .themedFont(name: .extraBold, size: .large)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 50, alignment: .leading)
                    .padding(.leading, 17)
                    .foregroundColor(SystemColors.backgroundText)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        JTextFieldView(title: "Titel", fieldType: .regular, text: $viewModel.eventTitle)
                        
                        JTextFieldView(title: "Evenement datum", fieldType: .date, text: $viewModel.eventDate)
                        
                        JTextFieldView(title: "Inschrijven vanaf", fieldType: .date, text: $viewModel.eventRegisterFromDate)
                        
                        JTextFieldView(title: "Inschrijven tot", fieldType: .date, text: $viewModel.eventRegisterTilldate)
                        
                        Toggle(isOn: $viewModel.membersOnly) {
                            Text("Alleen voor leden")
                                .themedFont(name: .semiBold, size: .title)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(SystemColors.backgroundText)
                        }
                        .tint(SystemColors.backgroundText)
                        
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
                        
                        VStack {
                            JTextView(title: "Omschrijving", text: $viewModel.eventContent, isSelected: false)
                        }
                        
                        Button {
                            // send
                        } label: {
                            ZStack {
                                SystemColors.theme1
                                    .cornerRadius(5)
                                    .frame(height: 60, alignment: .center)
                                    .padding(.leading, 17)
                                    .padding(.trailing, 17)
                                    .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                                
                                Text("Verstuur")
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
        }
        .background(SystemColors.background)
        // popups here
    }
}

struct NewEventView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventView()
    }
}
