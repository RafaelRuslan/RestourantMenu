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
                    .keyboardType(.phonePad)
                    .textFieldStyle(.roundedBorder)
                Button{
                    dismiss()
                }label:{
                    Text("Save")
                }
                .infoStyle()
                Spacer()
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
            }
        }
    }
}


