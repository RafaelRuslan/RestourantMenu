//
//  usernameModify.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 17.08.25.
//

import SwiftUI

struct usernameModify: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.leading, 15)
            .frame(height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .background(Color.gray.opacity(0.22))
            .overlay (
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth: 1)
            )
        
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
    }
}

extension View{
    func userModifier() -> some View{
        self.modifier(usernameModify())
    }
}
