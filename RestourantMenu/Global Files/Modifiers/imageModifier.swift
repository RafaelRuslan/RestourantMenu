//
//  imageModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.08.25.
//

import SwiftUI

struct imageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View{
    func imageModify() -> some View{
        self.modifier(imageModifier())
    }
}
