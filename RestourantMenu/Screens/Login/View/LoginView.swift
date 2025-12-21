//
//  LoginView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 16.12.25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var vm = LoginViewModel()
    
    var body: some View {
        
        LoginMainView(
            name: $vm.name,
            email: $vm.email,
            showPassword: $vm.showPassword,
            password: $vm.password,
            onLogin: {vm.loginUser() },
            onRegister: { vm.registerUser()}
        )
    }
}
