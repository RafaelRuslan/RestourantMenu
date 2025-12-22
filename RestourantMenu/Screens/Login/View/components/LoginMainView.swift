//
//  LoginMainView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI
import LocalAuthentication

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
            
            Button{
                authenticateWithFaceID()
            }label: {
                HStack{
                    Image(systemName: "faceid")
                        .fontModifier(size: 15, weight: .semibold)
                    
                    Text("Face ID")
                        .fontModifier(size: 15, weight: .semibold)
                }
                .padding()
                .foregroundStyle(.colorWhite)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.top, 10)
            
        }
        .padding()
    }
    func authenticateWithFaceID(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Success Face ID"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, AuthError in
                if success{
                    onLogin()
                }else {
                    print("Error: \(String(describing: AuthError?.localizedDescription))")
                }
            }
        }
    }
}

