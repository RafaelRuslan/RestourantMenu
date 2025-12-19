//
//  EmailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct EmailView: View {
    
    @Binding var email: String
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                TextField("Enter mail", text: $email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button{
                    dismiss()
                }label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .font(.system(size: 18, weight: .semibold))
                }
                .primaryActionModifier()
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding()
            }
            .navigationBarBackButtonHidden()
            .toolbar{
               toolbar
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("E-Mail")
                .font(.title)
                .bold()
        }
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}

#Preview {
    EmailView(email: .constant("test21"))
}
