//
//  LoginOrRegisterButton.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct LoginOrRegisterButton: View {
    
    var onLogin: () -> Void
    
    @FocusState private var focus: Focused?
    
    var onRegister: () -> Void
    var body: some View {
        
        HStack{
            Button{
                focus = nil
                onLogin()
            }label: {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .font(.system(size: 18, weight: .semibold))
                
            }
            
            .primaryActionModifier()
            
            Button{
                focus = nil
                onRegister()
            }label: {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .font(.system(size: 18, weight: .semibold))
                
            }
            .primaryActionModifier()
            
        }
    }
}

extension LoginOrRegisterButton{
    enum Focused{
        case name, password
    }
}

