//
//  ExampleForm.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 02/01/2022.
//

import SwiftUI

struct ExampleForm: View {
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                JTextFieldView("Voornaam", type: .firstname)
                JTextFieldView("Achternaam", type: .lastname)
                
                JTextFieldView("Geboorte", type: .date)
                JTextFieldView("Email", type: .email)
                JTextFieldView("Postcode", type: .zip)
                JTextFieldView("Telefoon", type: .phone)
            }
            .padding()
        }
    }
}

struct ExampleForm_Previews: PreviewProvider {
    static var previews: some View {
        ExampleForm()
    }
}
