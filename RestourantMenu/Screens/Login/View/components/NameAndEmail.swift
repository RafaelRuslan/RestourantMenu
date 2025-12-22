//
//  NameAndEmail.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct NameAndEmail: View {
    
    @Binding var name: String
    
    @FocusState private var focus: Focused?
    
    @Binding var email: String
    
    var body: some View {
        
        TextField("Select your name", text: $name)
            .inputModifier()
            .padding(.leading, 3)
            .textContentType(.oneTimeCode)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .keyboardType(.asciiCapable)
            .focused($focus, equals: .name)
        
        TextField("Email", text: $email)
            .inputModifier()
            .padding(.leading, 3)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .keyboardType(.asciiCapable)
            .textContentType(.oneTimeCode)
            .focused($focus, equals: .email)
        
    }
}

extension NameAndEmail{
    enum Focused{
        case name, email
    }
}
