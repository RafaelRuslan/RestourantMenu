//
//  PlusModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.08.25.
//

import SwiftUI

struct PlusModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.green)
    }
}

extension View{
    func plusModify() -> some View{
        self.modifier(PlusModifier())
    }
}
