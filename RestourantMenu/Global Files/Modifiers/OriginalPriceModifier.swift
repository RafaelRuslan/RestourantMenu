//
//  OriginalPriceModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.08.25.
//

import SwiftUI

struct OriginalPriceModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .strikethrough()
            .foregroundStyle(.gray)
            .lineLimit(.max)
    }
}

extension View{
    func priceModify() -> some View{
        self.modifier(OriginalPriceModifier())
    }
}
