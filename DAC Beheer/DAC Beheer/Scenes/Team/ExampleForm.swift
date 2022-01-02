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
                JTextFieldView("Voornaam")
                JTextFieldView("Achternaam")
                JTextFieldView("Geboorte")
                JTextFieldView("Ja IDK")
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
