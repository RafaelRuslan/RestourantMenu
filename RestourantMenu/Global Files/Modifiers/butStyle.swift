//
//  butStyle.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 14.07.25.
//

import SwiftUI

struct butStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .bold()
            .foregroundStyle(AngularGradient(colors: [.red, .purple], center: .center))
    }
}

extension View{
    func button_Style() -> some View{
        self.modifier(butStyle())
    }
}
