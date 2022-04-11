//
//  JTextView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/02/2022.
//

import SwiftUI
import UIKit


/// for large text content
///
struct JTextView: View {
    
    // Also responds as textfield title when highlightend
    var title = "Content"
    
    //font sizes
    let borderColor = SystemColors.JTextField.textFieldBorder
    let textColor = SystemColors.JTextField.textFieldText
    let background = SystemColors.JTextField.textFieldBackground
    
    //binding
    @Binding var text: String
    @State var isSelected: Bool = false

    private var hasValue: Bool {
        return text != ""
    }
    
    private var showBorder: Bool {
        return isSelected
    }
    
    var body: some View {
        VStack {
            titleSectionView(title: title, font: (name: .bold, size: .title), color: SystemColors.backgroundText)
                .padding(.bottom, -8)
            ZStack {
                TextEditor(text: $text)
                    .background(SystemColors.JTextField.textFieldText)
                    .themedFont(name: .regular, size: .regular)
                    .accentColor(SystemColors.JTextField.textFieldBorder)
                    .foregroundColor(SystemColors.JTextField.textFieldText)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(SystemColors.JTextField.textFieldBorder , lineWidth: showBorder ? 2 : 0)
                    )
                   
                    .cornerRadius(10)
                    .frame(minHeight: 120)
                    .onTapGesture {
                        // SwiftUI Don't supper end editing in textEditor yet.
                        // So here is a UIKit notification listener..
                        hideKeyBoard()
                    }
                Text(text).opacity(0).padding(.all, 8)
                    .themedFont(name: .regular, size: .regular)
                    .foregroundColor(SystemColors.itemTextColor)
                }
        }.onAppear {
            UITextView.appearance().backgroundColor = UIColor(SystemColors.JTextField.textFieldBackground)
        }
    }
    
    private func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

    }
}

struct JTextView_Previews: PreviewProvider {

    static var previews: some View {
        AddNewsArticleView(viewRouter: ViewRouter(), navigation: NavigationRouter())
    }
}
