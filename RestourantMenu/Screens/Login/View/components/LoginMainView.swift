//
//  LoginMainView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct LoginMainView: View {
    
    @Binding var name: String
    
    @Binding var email: String
    
    @Binding var showPassword: Bool
    
    @Binding var password: String
    
    var onLogin: () -> Void
    
    var onRegister: () -> Void
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8) {
            LoginTextUp()
            
            NameAndEmail(name: $name, email: $email)
            
            PasswordSection(showPassword: $showPassword, password: $password)
            
            LoginOrRegisterButton(onLogin: onLogin, onRegister: onRegister)
            
        }
        .padding()
    }
}

