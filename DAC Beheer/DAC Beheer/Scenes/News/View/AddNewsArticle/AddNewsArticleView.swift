//
//  AddNewsArticleView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/02/2022.
//

import SwiftUI

struct AddNewsArticleView: View {
    
    var navigation: NavigationRouter
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                NavigationTitleView(titleText: "Nieuw Artikel 🖌")
                // section 1
                VStack(spacing: 0) {
                    JTextFieldView(title: "Titel", fieldType: .regular, text: $title)
                        .padding(.leading, 17)
                        .padding(.trailing, 17)
                }
                // section 2
                VStack(spacing: 0) {
                 
                    HStack {
                        Text("Foto (optioneel)")
                            .themedFont(name: .semiBold, size: .largeValutaSub)
                            .foregroundColor(SystemColors.backgroundText)
                        Spacer()
                    }
                    .padding(.leading, 17)
                    
                    
                    ZStack {
                        SystemColors.JTextField.textFieldBackground
                            
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 60, height: 46, alignment: .center)
                            .foregroundColor(SystemColors.backgroundText)
                        VStack {
                            image?
                                .resizable()
                                .scaledToFit()
                                
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 34, alignment: .center)
                    .frame(minHeight: 200)
                    .cornerRadius(10)
                }
            
                .onTapGesture {
                    showingImagePicker = true
                }
            
                // section 3
                VStack(spacing: 0) {
                    HStack {
                        Text("Content")
                            .themedFont(name: .semiBold, size: .largeValutaSub)
                            .foregroundColor(SystemColors.backgroundText)
                        Spacer()
                    }
                    .padding(.leading, 17)
                    JTextView(text: $content)
                        .padding(.leading, 17)
                        .padding(.trailing, 17)
                }
                
                HStack {
                    Button {
                        // send data
                        Api.News.postNewsArticle(title: title, content: content, image: inputImage) { result in
                            switch result {
                            case .failure(let error):
                                Log.debug("error sending newsPost \(error.localizedDescription)")
                            case .success(let response):
                                Log.debug("success posting news! \(response.message ?? "")")
                                
                                withAnimation {
                                    navigation.close()
                                }
                            }
                        }
                      
                    } label: {
                        ZStack {
                            SystemColors.theme1
                                .cornerRadius(5)
                                .frame(height: 60, alignment: .center)
                                .padding(.leading, 17)
                                .padding(.trailing, 17)
                                .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 10)
                            
                            Text("Verstuur")
                                .themedFont(name: .extraBold, size: .largeValutaSub)
                                .foregroundColor(SystemColors.itemTextColor)
                                
                        }
                    }
                }
            }
            .onChange(of: inputImage) { _ in
                withAnimation {
                    loadImage()
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
        .background(SystemColors.background)
    }
    
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct NewsPost: Encodable {
    var title: String
    var content: String
}


struct AddNewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewsArticleView(navigation: NavigationRouter())
    }
}
