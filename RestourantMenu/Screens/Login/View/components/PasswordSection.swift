//
//  PasswordSection.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct PasswordSection: View {
    
    @Binding var showPassword: Bool
    
    @FocusState private var focused: Focused?
    
    @Binding var password: String
    
    var body: some View {
        HStack{
            if !showPassword{
                SecureField("Password", text: $password)
                    .focused($focused, equals: .password)
                    .padding(.leading, 3)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .textContentType(.oneTimeCode)
            }else {
                TextField("Password", text: $password)
                    .padding(.leading, 3)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .textContentType(.oneTimeCode)
                    .focused($focused, equals: .password)
                
            }
            Button{
                showPassword.toggle()
            }label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundStyle(.colorGray)
            }
        }
        .inputModifier()
       
    }
}

extension PasswordSection{
    enum Focused{
        case password
    }
}

//#Preview {
//    PasswordSection()
//}
