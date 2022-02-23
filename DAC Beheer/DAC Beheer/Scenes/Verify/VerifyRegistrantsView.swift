//
//  VerifyRegistrantsView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import SwiftUI

struct VerifyRegistrantsView: View {
    
    @ObservedObject var model = VerifyModel()
    
    @State var presentSuccess = false
    @State var presentFailure = false
    
    @State var presentConfirmation = false
    
    var isPresenting: Bool {
        return presentSuccess || presentFailure || presentConfirmation
    }
    
    var body: some View {

        if !model.registrants.isEmpty {
            ZStack {
                ScrollView(showsIndicators: false) {
                    ForEach(model.registrants, id: \.self) { registrant in
                        HStack(spacing: 10) {
                            RegistrantReusableView(newRegistrant: registrant)
                                .padding(.leading, 10)
                            
                            HStack(spacing: 10) {
                                
                                Button {
                                    // accept
                                    if isPresenting { return }
                                    
                                    Api.Verify.verifyUser(id: registrant.id) { result in
                                        switch result {
                                        case .success( _ ):
                           
                                            presentSuccess = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                presentSuccess = false
                                                model.reload()
                                            }
                                            
                                        case .failure(let error):
                                            Log.debug("error: \(error.localizedDescription)")
                                            presentFailure = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                                presentFailure = false
                                            }
                                        }
                                    }
                                    
                                } label: {
                                    ZStack {
                                        Color.green
                                            .frame(width: 54, height: 60, alignment: .center)
                                            .cornerRadius(5)
                                        
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 30, height: 30, alignment: .center)
                                        
                                    }
                                }

                                Button {
                                    // remove
                                    if isPresenting { return }
                                    
                                    Api.Verify.deleteUser(id: registrant.id) { result in
                                        switch result {
                                        case .success( _ ):
                           
                                            presentSuccess = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                presentSuccess = false
                                                model.reload()
                                            }
                                            
                                        case .failure(let error):
                                            Log.debug("error: \(error.localizedDescription)")
                                            presentFailure = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                                presentFailure = false
                                            }
                                        }
                                    }
                                } label: {
                                    ZStack {
                                        Color.red
                                            .frame(width: 54, height: 60, alignment: .center)
                                            .cornerRadius(5)
                                        
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 30, height: 30, alignment: .center)
                                    }
                                }
                            }
                            .padding(.trailing, 10)
                        }
                      
                    }
                    Spacer()
                }
                .background(SystemColors.background)
                if presentSuccess {
                    CheckMarkAnimation()
                }
                
                if presentFailure {
                    XmarkAnimation()
                }
                
                if presentConfirmation {
                    // present confirmation alert
                }
            }
        } else {
            Spacer()
            EmptyViewModel()
            Spacer()
        }
    }
}

struct VerifyRegistrantsView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyRegistrantsView()
    }
}
