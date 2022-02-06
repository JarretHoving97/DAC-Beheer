//
//  VerifyRegistrantsView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import SwiftUI

struct VerifyRegistrantsView: View {
    
    @ObservedObject var model = VerifyModel()
    
    var body: some View {
        if model.registrants.isEmpty {
            ScrollView(showsIndicators: false) {
                ForEach(model.registrants, id: \.self) { registrant in
                    RegistrantReusableView(newRegistrant: registrant)
                }
                Spacer()
            }
            .background(SystemColors.background)
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
