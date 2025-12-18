//
//  LoginViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 16.12.25.
//

import SwiftUI
import Firebase
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    
    @Published var password: String = ""
    
    @Published var showAlert: Bool = false
    
    @Published var alertMessage: String = ""
    
    @Published var user: User? = nil
    
    @Published var isAuthorized: Bool = false
    
    @Published var showPassword = false
    
    @AppStorage("user_name") var name: String = ""
    
    @Published var phone: String = "1234334"
    
    
    init(){
        self.user = Auth.auth().currentUser
        if let user = self.user {
            
            isAuthorized = true
        }else {
            
            isAuthorized = false
        }
        Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                self.user = user
                self.isAuthorized = user != nil
                self.email = user?.email ?? ""
            }
        }
    }
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                
                if let error = error {
                    
                    self?.alertMessage = error.localizedDescription
                    self?.showAlert = true
                } else if let user = result?.user {
                   
                    self?.user = user
                    self?.email = user.email ?? ""
                    self?.isAuthorized = true
                }
            }
        }
    }
    
    func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self else {return}
            DispatchQueue.main.async {
                
                if let error = error {
                    
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                } else if let user = result?.user {
                    
                    self.user = user
                   
                    self.email = user.email ?? ""
                    self.isAuthorized = true
                }
            }
        }
    }
    
    func logoutUser(){
        do{
            try Auth.auth().signOut()
            self.user = nil
            self.isAuthorized = false
            print("Logout successful")
        }catch{
            print("Logout failed: \(error.localizedDescription)")
            self.alertMessage = error.localizedDescription
            self.showAlert = true
        }
    }
    
    func deleteUser(password: String? = nil){
        guard let user = Auth.auth().currentUser else { return }
        
        if let password = password, let email = user.email{
            let credential = EmailAuthProvider.credential(withEmail: email, password: password)
            user.reauthenticate(with: credential){ [weak self] _, error in
                if let error = error{
                    DispatchQueue.main.async {
                        self?.alertMessage = "Reauthentication failed: \(error.localizedDescription)"
                        self?.showAlert = true
                    }
                    return
                }
                self?.performDelete(user: user)
                
                
            }
        }else {
            performDelete(user: user)
        }
    }
    
    private func performDelete(user: User){
        user.delete { [weak self] error in
            DispatchQueue.main.async {
                if let error = error{
                    self?.alertMessage = "Delete failed: \(error.localizedDescription)"
                    self?.showAlert = true
                }else {
                    self?.user = nil
                    self?.name = ""
                    self?.isAuthorized = false
                    print("Deleted user successfully")
                }
            }
        }
        
    }
}
