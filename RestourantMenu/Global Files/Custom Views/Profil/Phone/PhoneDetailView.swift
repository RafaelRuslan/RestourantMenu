//
//  PhoneDetailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct PhoneDetailView: View {
    
    @Binding var phone: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                TextField("Enter phone number", text: $phone)
                    .padding(.top, 10)
                    .keyboardType(.phonePad)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button{
                    dismiss()
                }label:{
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
            .toolbar {
               toolbar
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("Phone Number")
                .font(.largeTitle)
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


