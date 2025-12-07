//
//  PadModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.08.25.
//

import SwiftUI

struct PadModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.green)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
    }
}

extension View{
    func padModify() -> some View{
        self.modifier(PadModifier())
    }
}
