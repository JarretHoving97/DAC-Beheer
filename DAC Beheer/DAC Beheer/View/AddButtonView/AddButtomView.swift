//
//  AddButtomView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 07/02/2022.
//

import Foundation
import SwiftUI


struct AddButtonView: View {
    
    let systemName: String //"note.text.badge.plus"
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                    .fill(SystemColors.background)
                    .frame(width: 62, height: 62, alignment: .trailing)
                    
                    Image(systemName: systemName)
                        .resizable()
                        .frame(width: 32, height: 28, alignment: .center)
                        .padding(.leading, 5)
                        .foregroundColor(SystemColors.theme1)
                        
                        
                }
            }
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
     AddButtonView(systemName: "note.text.badge.plus")
         
    }
}
