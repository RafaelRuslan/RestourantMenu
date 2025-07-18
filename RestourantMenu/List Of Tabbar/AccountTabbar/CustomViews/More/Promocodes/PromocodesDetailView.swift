//
//  PromocodesDetailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct PromocodesDetailView: View {
    @Binding var more: ProfileModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 20) {
                
                TextField("Enter promocodes", text: $more.name)
                    .keyboardType(.default)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Promocode Page")
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

