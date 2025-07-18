//
//  PromocodesDetailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct PromocodesDetailView: View {
    @State private var promocode : String = ""
    @State private var message: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 20) {
                
                Text("Enter Promocode")
                    .font(.headline)
                
                TextField("Enter promocodes", text: $promocode)
                    .keyboardType(.default)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Succeded"){
                    if promocode.uppercased() == "SALAM2024" || promocode.lowercased() == "ruslan2023"{
                        message = "Promocode accepted 🎉"
                    }else{
                        message = "wrong promocode ‼️"
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(message)
                    .foregroundStyle(.gray)
                    .padding()
                
                Spacer()
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

