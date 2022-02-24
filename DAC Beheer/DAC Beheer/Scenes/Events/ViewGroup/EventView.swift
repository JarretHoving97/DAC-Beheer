//
//  EventView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 24/02/2022.
//

import SwiftUI

struct EventView: View {
    
    let event: Event
    
    var body: some View {

        HStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(event.title)
                        .themedFont(name: .semiBold, size: .largeValutaSub)
                    Spacer()
                    Text(event.eventDateFormatted)
                        .themedFont(name: .regular, size: .regular)
                    Spacer()
                }
                .padding(17)
                .themedFont(name: .bold, size: .large)
                .foregroundColor(SystemColors.itemTextColor)
                Spacer()

            }
            .background(SystemColors.theme1)
            .frame(height: 90)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event(id: 2, title: "Test", content: "Pik", image: "", registerFrom: "", registerTill: "", eventDate: "", membersOnly: false, cancelled: true))
    }
}
