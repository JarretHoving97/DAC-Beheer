//
//  JTextFieldDateView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 04/01/2022.
//

import SwiftUI


struct JTextFieldateView: View {
    
    // Also responds as textfield title when highlightend
    var title = "Title"

    
    //font sizes
    let borderColor = SystemColors.JTextField.textFieldBorder
    let textColor = SystemColors.JTextField.textFieldText
    let background = SystemColors.JTextField.textFieldBackground
    
    //binding
    @State var text: String = ""
    @State var isSelected: Bool = false
    
    private var hasValue: Bool {
        return text != ""
    }
    
    private var showBorder: Bool {
        return isSelected
    }
    
    //add also contenViewType
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            Text(title).themedFont(name: .bold, size: .subtitle)
                .foregroundColor(textColor)
                .offset(y: isSelected ? 0 : 10)
                .padding(.bottom, -5)
                .opacity(!isSelected ? 0 : 1)
            
            
            HStack(spacing: 0) {
                TextField("", text: $text, onEditingChanged: { editing in
                    
                    if !hasValue {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            isSelected = editing
                        }
                    }
                }, onCommit: {
                    if !hasValue {
                        isSelected = false
                    }
                })
                    .accentColor(SystemColors.JTextField.textFieldBorder)
                    .foregroundColor(SystemColors.JTextField.textFieldText)
                    .themedFont(name: .regular, size: .title)
                    .placeholder(when: !isSelected, placeholder: {
                        Text(title)
                            .foregroundColor(SystemColors.JTextField.textFieldText)
                            .themedFont(name: .bold, size: .title)
                            .opacity(isSelected ? 0 : 1)
                            .accentColor(textColor)
                            .padding(.bottom, 10)
                    })
            }
        }
        
        .frame(maxWidth: .infinity, minHeight: 59, alignment: .leading)
        .padding(.trailing)
        .padding(.leading)
        .background(SystemColors.JTextField.textFieldBackground)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(SystemColors.JTextField.textFieldBorder , lineWidth: showBorder ? 2 : 0)
        )
    }
}
