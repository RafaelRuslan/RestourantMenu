//
//  LogoutViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 07.12.25.
//

import Foundation

class LogoutViewModel: ObservableObject{
    
    @Published var profile = LogModel()

    @Published var success = false
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    @Published var alertSuccess = false
    
    var isEnter: Bool {
        !profile.name.trimmingCharacters(in: .whitespaces).isEmpty &&
        !profile.password.trimmingCharacters(in: .whitespaces).isEmpty
        
    }
    func validate() {
        if profile.name.isEmpty || profile.password.isEmpty {
            alertMessage = "Username or Password is empty ❌"
            alertSuccess = false
        } else if !isValidEmail(profile.name) {
            alertMessage = "E-mail format is wrong ❌"
            alertSuccess = false
        } else if profile.password.count < 9 {
            alertMessage = "Password must be minimum 9 characters ❌"
            alertSuccess = false
        } else {
            alertMessage = "Success Login ✅"
            alertSuccess = true
        }
        showAlert = true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            .evaluate(with: email)
    }
}
