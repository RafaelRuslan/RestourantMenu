//
//  ZoomImageScreen.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct ZoomImageScreen: View {
    
    let imageName: String
    
    @State private  var scale: CGFloat = 1.0
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                Color.colorBlack
                    .ignoresSafeArea()
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                    .scaleEffect(scale)
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ value in
                                scale = value
                            }
                            .onEnded{ _ in
                                withAnimation(.spring()) { scale = 1}
                            }
                    )
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                            
                                .fontModifier(size: 30, weight: .semibold, foregroundColor: .colorWhite)
                                .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
