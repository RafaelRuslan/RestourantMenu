//
//  PaddingModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.08.25.
//

import SwiftUI

struct PaddingModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 6)
            .background{
                Color
                    .white.opacity(0.5)
            }
    }
}

extension View{
    func paddingModify() -> some View{
        self.modifier(PaddingModifier())
    }
}
