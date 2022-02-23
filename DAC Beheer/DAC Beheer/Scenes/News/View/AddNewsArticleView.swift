//
//  AddNewsArticleView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 08/02/2022.
//

import SwiftUI

struct AddNewsArticleView: View {
    
    var viewRouter: ViewRouter
    var navigation: NavigationRouter

    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var title: String = ""
    @State private var content: String = ""
    
    @State var successPopup = false
    @State var failurePopup = false
    
    
    var canSend: Bool {
        return !content.isEmpty && !title.isEmpty
    }
    

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    NavigationTitleView(titleText: "Nieuw artikel 🖌")
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
                            
                            if canSend {
                                Api.News.postNewsArticle(title: title, content: content, image: inputImage) { result in
                                    switch result {
                                    case .failure(let error):
                                        Log.debug("error sending newsPost \(error.localizedDescription)")
                                        
                                        failurePopup = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            failurePopup = false
                                        }
                                        
                                    case .success(let response):
                                        Log.debug("success posting news! \(response.message ?? "")")
                                        
                                        successPopup = true
                                        
                                        withAnimation(Animation.easeOut(duration: 0.22).delay(1.2)) {
                                            navigation.close()
                                            viewRouter.isPresenting = false // for showing the previous xmark
                                            
                                        }
                                    }
                                }
                            } else {
                                failurePopup = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    failurePopup = false
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
            
            if successPopup {
                CheckMarkAnimation()
            }
            
            if failurePopup {
                XmarkAnimation()
            }
        }
        
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

//
//struct AddNewsArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewsArticleView(viewRouter: ViewRouter, navigation: NavigationRouter())
//    }
//}
