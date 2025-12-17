//
//  LoginView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 16.12.25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var vm = LoginViewModel()
    
    @FocusState private var focus: Focused?
    
    var body: some View {
        
            VStack(alignment: .center, spacing: 0) {
                VStack(spacing: 12){
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Welcome to Restourant Menu")
                        .fontModifier(size: 22, weight: .semibold, foregroundColor: .colorBlack)
                    
                    Text("Please sign in")
                        .fontModifier(size: 16, weight: .semibold, foregroundColor: .colorGray)
                    
                }
                
                TextField("Select your name", text: $vm.name)
                    .inputModifier()
                    .padding()
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .focused($focus, equals: .name)
                
                TextField("Email", text: $vm.email)
                    .inputModifier()
                    .padding()
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .focused($focus, equals: .email)
                
                
                HStack{
                    if !vm.showPassword{
                        SecureField("Password", text: $vm.password)
                            .focused($focus, equals: .password)
                    }else {
                        TextField("Password", text: $vm.password)
                            .focused($focus, equals: .password)
                        
                    }
                    Button{
                        vm.showPassword.toggle()
                    }label: {
                        Image(systemName: vm.showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.colorGray)
                    }
                }
                .inputModifier()
                .padding()
                HStack{
                    Button{
                        focus = nil
                        vm.loginUser()
                    }label: {
                        Text("Sign up")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .font(.system(size: 18, weight: .semibold))
                        
                    }
                    
                    .primaryActionModifier()
                    
                    Button{
                        focus = nil
                        vm.registerUser()
                    }label: {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .font(.system(size: 18, weight: .semibold))
                        
                    }
                    .primaryActionModifier()
                    
                }
                .padding()
            }
    }
}

extension LoginView{
    enum Focused{
        case email, password, name
    }
}

