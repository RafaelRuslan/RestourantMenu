//
//  ProfileDetailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct NameDetailView: View {
   
    @Binding var name: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 20) {
                TextField("Enter new name...", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
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
            .padding()
            .toolbar {
               toolbar
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
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

