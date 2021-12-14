//
//  MenuButtonsViewModel.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 13/12/2021.
//

import SwiftUI

struct MenuButtonsViewModel: View {
    let model: MenuButton
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Image(model.imageName)
                        .frame(width: 80, height: 80, alignment: .center)
                    Text(model.subTitle).themedFont(name: .bold, size: .subtitle).foregroundColor(.white)
                }
             Spacer()
            }
            Spacer()
        }
        .frame(width: .infinity, height: .infinity, alignment: .topLeading)
        .background(SystemColors.theme1)
    }
}

struct MenuButtonsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonsViewModel(model: MenuButton(imageName: "volleyball_menu_image", subTitle: "Wedstrijden"))
    }
}
