//
//  InfoStyle.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 11.07.25.
//


import SwiftUI

struct InfoStyle: ViewModifier{

    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .bold()
            .foregroundStyle(.blue)
    }
}

extension View{
    func infoStyle() -> some View{
        self.modifier(InfoStyle())
    }
}
