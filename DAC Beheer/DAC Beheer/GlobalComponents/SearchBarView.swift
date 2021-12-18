//
//  SearchBarView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 18/12/2021.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var text: String = ""
    
    var hasText: Bool {
        return text != ""
    }
    
    let color = Color(red: 196 / 255, green: 169 / 255, blue: 196 / 255, opacity: 0.30)

    var body: some View {
        
        VStack{
            HStack {
                TextField("Zoeken..", text: $text)
                    .accentColor(SystemColors.theme1)
                    .foregroundColor( hasText ? Color.gray.opacity(0.8): .black)
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.size.width - 24, height: 35, alignment: .leading)
            .font(.system(size: 14))
            .background(color)
            .cornerRadius(15)
            .padding(10)
           
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
