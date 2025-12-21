//
//  ZoomImageScreen.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct ZoomImageScreen: View {
    
    let imageName: String

    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var zoomVM = ZoomImageViewModel()
    
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                Color.colorBlack
                    .ignoresSafeArea()
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                    .scaleEffect(zoomVM.scale)
                    .gesture(
                        
                        MagnificationGesture()
                            .onChanged{ zoomVM.scale = $0
                            }
                            .onEnded{ _ in
                                withAnimation(.spring()) { zoomVM.scale = 1}
                            }
                    )
                        
                    .shadow(radius: 10)
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
