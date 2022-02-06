//
//  CustomNavigation.swift
//  DAC Beheer
//
//  Created by Jarret Hoving on 06/02/2022.
//

import SwiftUI

class NavigationRouter: ObservableObject {
    
    var viewsToPresent: [AnyView] = []
    
    @Published private(set) var currentViewIndex: Int = 0 //always start from firstIndex
    @Published var currentPresentedView: AnyView?
    
    @Published private(set) var isPresenting: Bool = false
    

    public func present() {
        isPresenting = true
    }
    
    public func addView(_ view: AnyView) {
        viewsToPresent.append(view)
        showCurrentSelected()
    }
    
    public func addAndPresent(_ view: AnyView) {
        viewsToPresent.append(view)
        goToNextView()
        showCurrentSelected()
    }
    
    public func showCurrentSelected() {
        currentPresentedView = viewsToPresent[currentViewIndex]
    }
    
    private var lastViewPresented: Bool {
        return currentViewIndex == viewsToPresent.count - 1
    }
    
    public func goToNextView() {
        if !lastViewPresented {
            currentViewIndex += 1
        }
    }
    
    public func goToBack() {
        if currentViewIndex == 0 {
            close()
        } else {
            currentViewIndex -= 1
        }
    }
    
    public func close() {
        isPresenting = false
    }
    
}

/// ReturnableView is a frame that returns a view. It will be om top of ContentView
/// Tis will accept anyview so you can pass in anything u want.
struct NavigationsReturnableView<Content>: View where Content: View {
    
    @StateObject var navigationViewRouter: NavigationRouter
    var content: () -> Content
    
    var views: Content {
        return content()
    }
    
    var shouldPresentView: Bool {
        return navigationViewRouter.isPresenting
    }
    
    @ViewBuilder
    var body: some View {
        ZStack {
            if shouldPresentView {
                views
                VStack{
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                navigationViewRouter.close()
                            }
                        } label: {
                            Image("ic_cross_image")
                                .renderingMode(.template)
                                .tint(SystemColors.backgroundText)
                                .padding(.trailing, 20)
                                
                             
                        }
                        .padding(.top, 12)
                    }
                    Spacer()
                }
            }
        }
    }
}