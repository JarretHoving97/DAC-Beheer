//
//  CheckMarkAnimation.swift
//  CheckMark
//
//  Created by Jarret Hoving on 21/02/2022.
//

import SwiftUI

struct CheckMarkAnimation: View {
    
    @State var progess: CGFloat = 1
    @State var showCheckmark = -78
    
    @State var didFinish: Bool = false
    
    @State var backgroundAlpha = 0.0
    
    var duration: CGFloat = 0.3
    
    var body: some View {
        ZStack {
            
            Color(UIColor.systemBackground)
                .opacity(backgroundAlpha)
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(10)
            
            
            Circle()
                .trim(from: self.progess, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color.green]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .frame(width: 100, height: 100)
            
            Image(systemName: "checkmark")
                .font(.system(size: 70))
                .clipShape(Rectangle().offset(x: CGFloat(showCheckmark)))
                .foregroundColor(Color.green)
            
                .onAppear {
                    withAnimation(.easeIn(duration: duration)) {
                        self.backgroundAlpha = 0.8
                        self.progess = 0
                    }
                    
                    withAnimation(.easeIn(duration: duration).delay(0.2)) {
                        self.showCheckmark = 0
                    }
                    
                    didFinish = false
                }
        }
    }
}


struct CheckMarkAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CheckMarkAnimation()
    }
}
