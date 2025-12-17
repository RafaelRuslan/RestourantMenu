//
//  View+Extension.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 16.12.25.
//

import SwiftUI

extension View {
    
    public func roundedCorners(cornerRadius: CGFloat = 12.0, rect: UIRectCorner = .allCorners) -> some View{
        clipShape(
            RoundedCorner(
                radius: cornerRadius,
                corners: rect
            )
        )
    }
    
    public func geometryReader(complition: @escaping (GeometryProxy) -> Void) -> some View {
        overlay {
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        complition(geometry)
                    }
                    .onChange(of: geometry.frame(in: .global)){
                        complition(geometry)
                    }
            }
        }
    }
    
}
