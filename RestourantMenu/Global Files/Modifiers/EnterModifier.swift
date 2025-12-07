//
//  EnterModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 17.08.25.
//

import SwiftUI

struct EnterModifier: ViewModifier{
    
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .frame(width: 180)
            .background(
                Color.blue
            )
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 2)
    }
}

extension View{
    func enterModifier() -> some View{
        self.modifier(EnterModifier())
    }
}
