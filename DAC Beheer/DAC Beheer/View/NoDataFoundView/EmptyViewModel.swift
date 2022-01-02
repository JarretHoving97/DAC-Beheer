//
//  EmptyViewModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 22/12/2021.
//

import SwiftUI

struct EmptyViewModel: View {
    var body: some View {
        VStack {
            Image(uiImage: NoContentModel.returnRandomEmptyImage())
            
            Text("Geen data gevonden..")
                .themedFont(name: .semiBold, size: .largeValutaSub)
                .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.965))
        }
        .frame(width: 230, height: 200, alignment: .center)
        
    }
}

struct EmptyViewModel_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewModel()
    }
}
