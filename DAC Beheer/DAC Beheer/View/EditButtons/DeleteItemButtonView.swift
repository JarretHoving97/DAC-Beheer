//
//  DeleteItemView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 16/04/2022.
//

import SwiftUI

struct DeleteItemView: View {
    var body: some View {
        ZStack {
            Color.red
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(100)
            
            VStack(spacing: 0) {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(SystemColors.backgroundText)
            }
        }
    }
}

struct DeleteItemView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteItemView()
    }
}
