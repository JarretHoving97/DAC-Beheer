//
//  UpdateNewsArticleView.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 23/02/2022.
//

import SwiftUI
import UIKit

struct UpdateNewsArticleView: View {
    
    var viewRouter: ViewRouter
    var navigation: NavigationRouter

    @State var newsItem: NewsItem
    
    @State private var showingImagePicker = false
    
    @State var successPopup = false
    @State var failurePopup = false
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State var currentImage: UIImage?
    
    @State var showDownloadedImage: Bool = false

    
    var canSend: Bool {
        return !newsItem.title.isEmpty && !newsItem.content.isEmpty
    }

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    NavigationTitleView(titleText: "Wijzig artikel..")
                    // section 1
                    VStack(spacing: 0) {
                        JTextFieldView(title: "Titel", fieldType: .regular, text: $newsItem.title)
                            .padding(.leading, 17)
                            .padding(.trailing, 17)
                    }
                    // section 2
                    VStack(spacing: 0) {
                     
                        HStack {
                            Text("Foto")
                                .themedFont(name: .semiBold, size: .largeValutaSub)
                                .foregroundColor(SystemColors.backgroundText)
                            Spacer()
                        }
                        .padding(.leading, 17)
                        
                        ZStack {
                            SystemColors.JTextField.textFieldBackground
                    
                            if showDownloadedImage  {
                                Image(uiImage: currentImage!)
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .frame(width: 60, height: 46, alignment: .center)
                                    .foregroundColor(SystemColors.backgroundText)
                            }
                         
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
                        JTextView(text: $newsItem.content)
                            .padding(.leading, 17)
                            .padding(.trailing, 17)
                    }
                    
                    HStack {
                        Button {
                            // send data
                            
                            if canSend {
                                Api.News.updateNewsArticle(title: newsItem.title, content: newsItem.content, image: inputImage, id: newsItem.id) { result in
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
                                
                                Text("Update")
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
        .onAppear {
            downloadImage()
        }
    }
    
    func downloadImage(){
        let imageView = UIImageView()

        imageView.sd_setImage(with: WebImageHelper.imageUrl(newsItem.image ?? "")) { image, error, _, _ in
            
            if let error = error {
                Log.debug("error downloading image \(error.localizedDescription)")
            } else {
                currentImage = image
                showDownloadedImage = true
            }
        
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        showDownloadedImage = false
    }
}
