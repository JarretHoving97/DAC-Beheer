//
//  AddButtomView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 07/02/2022.
//

import Foundation
import SwiftUI


struct AddButtonView: View {
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Circle()
                .fill(SystemColors.theme1)
                
                .frame(width: 100, height: 100, alignment: .trailing)
            }
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
     AddButtonView()
         
    }
}
