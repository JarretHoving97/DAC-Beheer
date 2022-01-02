//
//  SettingsView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 23/12/2021.
//

import SwiftUI

struct SettingsView: View {
    
    let model = MenuButton(imageName: "ic_settings_menu_image", subTitle: "Instellingen")
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Image(model.imageName)
                        .resizable()
                        .renderingMode(.template)
                        .tint(SystemColors.theme1)
                        .frame(width: 80, height: 80, alignment: .center)
                    
                    Text(model.subTitle).themedFont(name: .bold, size: .subtitle)
                }
             Spacer()
            }
           
            Spacer()
        }
       
        .foregroundColor(SystemColors.backgroundText)
      
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
