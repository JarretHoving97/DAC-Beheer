//
//  JTextFieldView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 02/01/2022.
//

import SwiftUI

struct JTextFieldView: View {
    
    // Also responds as textfield title when highlightend
    var title: String
    var fieldType: FieldType
    
    //font sizes
    let borderColor = SystemColors.JTextField.textFieldBorder
    let textColor = SystemColors.JTextField.textFieldText
    let background = SystemColors.JTextField.textFieldBackground
    
    //binding
    @Binding var text: String
    @State var isSelected: Bool = false
    
    private var hasValue: Bool {
        return !text.isEmpty
    }
    
    private var showBorder: Bool {
        return isSelected
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
                    .keyboardType(keyboardType)
                    .textContentType(textContentType)
            }
        }
        
        .onAppear(perform: {
            if hasValue {
                isSelected = true
            }
        })
        
        .frame(maxWidth: .infinity, minHeight: 59, maxHeight: .infinity, alignment: .leading)
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

extension JTextFieldView {
    
    enum FieldType {
        case username
        case firstname
        case lastname
        case middlename
        case password
        case phone
        case email
        case zip
        case regular
        case date
    }
    

    var keyboardType: UIKeyboardType {
        switch fieldType {
        
        case .phone:
            return .phonePad
        case .email:
            return .emailAddress
        case .zip:
            return .numbersAndPunctuation
        default:
            return .default
        }
    }
    

    var textContentType: UITextContentType? {
        switch fieldType {
            
        case .firstname:
            return .givenName
            
        case .middlename:
            return .middleName
            
        case .lastname:
            return .familyName
            
        case .username:
            return .username
            
        case .password:
            return .password
            
        case .phone:
            return .telephoneNumber
            
        case .email:
            return .emailAddress
            
        case .zip:
            return .postalCode
            
        case .date:
            return .dateTime
            
        default:
            return nil
        }
    }
}

/// For TextFields placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct JTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleForm()
    }
}
