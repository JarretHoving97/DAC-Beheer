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
        VStack(spacing: 0) {
            Image(model.imageName)
                .frame(width: 88, height: 88, alignment: .center)
            Text(model.subTitle).themedFont(name: .bold, size: .subtitle).foregroundColor(.white)
        }
        .background(SystemColors.theme1)
        .frame(width: .infinity, height: .infinity, alignment: .center)
    }
}

struct MenuButtonsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonsViewModel(model: MenuButton(imageName: "volleyball_menu_image", subTitle: "Wedstrijden"))
    }
}
