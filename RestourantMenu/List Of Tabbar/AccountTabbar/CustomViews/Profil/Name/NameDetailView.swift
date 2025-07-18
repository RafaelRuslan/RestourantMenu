//
//  ProfileDetailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct NameDetailView: View {
    @Binding var profile: ProfileModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                
                TextField("Enter new name...", text: $profile.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button{
                    dismiss()
                }label:{
                    Text("Save")
                        .infoStyle()
                }
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Name")
                        .font(.title)
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

