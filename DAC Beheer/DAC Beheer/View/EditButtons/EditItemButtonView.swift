//
//  EditItemButtonView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 16/04/2022.
//

import SwiftUI

struct EditItemButtonView: View {
    var body: some View {
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
}

struct EditItemButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemButtonView()
    }
}
