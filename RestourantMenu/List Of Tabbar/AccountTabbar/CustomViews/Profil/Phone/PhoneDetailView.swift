//
//  PhoneDetailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct PhoneDetailView: View {
    @Binding var profile: ProfileModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Text("Change phone number")
                    .font(.title2)
                
                TextField("Enter phone number", text: $profile.name)
                    .keyboardType(.phonePad)
                    .textFieldStyle(.roundedBorder)
                    .padding()
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
    }
}


