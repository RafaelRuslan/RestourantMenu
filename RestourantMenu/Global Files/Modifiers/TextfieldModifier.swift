//
//  TextfieldModifier.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.08.25.
//

import SwiftUI

struct TextfieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .keyboardType(.default)
            .textFieldStyle(.roundedBorder)
            .padding()
        
    }
}

extension View{
    func textFieldModifier() -> some View{
        self.modifier(TextfieldModifier())
    }
}
