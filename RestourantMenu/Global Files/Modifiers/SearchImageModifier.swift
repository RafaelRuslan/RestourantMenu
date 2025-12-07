//
//  SearchImageModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 28.08.25.
//

import SwiftUI

struct SearchImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

extension View{
    func searchImage() -> some View{
        self.modifier(SearchImageModifier())
    }
}
