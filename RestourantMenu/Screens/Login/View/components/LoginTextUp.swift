//
//  LoginTextUp.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct LoginTextUp: View {
    
    var body: some View {
       
        VStack(spacing: 12){
            Image(.logo)
                .resizable()
                .scaledToFit()
            
            Text("Welcome to Restourant Menu")
                .fontModifier(size: 22, weight: .semibold, foregroundColor: .colorBlack)
            
            Text("Please sign in")
                .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
            
        }
        
    }
}

#Preview {
    LoginTextUp()
}
