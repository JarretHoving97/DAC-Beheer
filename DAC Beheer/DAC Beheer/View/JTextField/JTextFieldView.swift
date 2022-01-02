//
//  JTextFieldView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 02/01/2022.
//

import SwiftUI

struct JTextFieldView: View {
    
    // Also responds as textfield title when highlightend
    var title = "Title"
    
   //font sizes
    let borderColor = SystemColors.JTextField.textFieldBorder
    let textColor = SystemColors.JTextField.textFieldText
    let background = SystemColors.JTextField.textFieldBackground
    
    //binding
    @State var text: String = ""
    @State var isSelected: Bool = false
    
    var hasValue: Bool {
        return text != ""
    }
    
    //add also contenViewType
    init(_ title: String ) {
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
                })
                    .placeholder(when: !isSelected, placeholder: {
                        Text(isSelected ? "" : title)
                        .foregroundColor(SystemColors.JTextField.textFieldText)
                        .themedFont(name: .bold, size: .title)
                        .accentColor(textColor)
                      
                        
                    })
                  
            }
        
          Text("")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        .frame(maxWidth: .infinity, minHeight: 59, alignment: .leading)
        .padding(.trailing)
        .padding(.leading)
        .background(SystemColors.JTextField.textFieldBackground)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(SystemColors.theme1 , lineWidth: isSelected ? 2 : 0)
        )
    }
}


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
