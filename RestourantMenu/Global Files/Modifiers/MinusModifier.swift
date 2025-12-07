//
//  MinusModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.08.25.
//

import SwiftUI

struct MinusModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.red)
    }
}

extension View{
    func minusModify() -> some View{
        self.modifier(MinusModifier())
    }
}
