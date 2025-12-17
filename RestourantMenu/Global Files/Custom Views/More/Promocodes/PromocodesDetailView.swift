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
    
    @State private var enterButton: Bool = false
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 20) {
                Text("Enter Promocode")
                    .font(.headline)
                
                TextField("Enter promocodes", text: $promocode)
                    .textFieldModifier()
                    .onChange(of: promocode) {
                           enterButton = !promocode.trimmingCharacters(in: .whitespaces).isEmpty
                       }
                
                Button("Enter"){
                    if promocode.uppercased() == "SALAM2024" || promocode.lowercased() == "ruslan2023"{
                        message = "Promocode accepted 🎉"
                    }else{
                        message = "wrong promocode ‼️"
                    }
                }
                .foregroundStyle(.white)
                .background(
                    Color.blue
                        .frame(width: 200, height: 41)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 1.2)
                )
                .disabled(!enterButton)
                .opacity(enterButton ? 1 : 0.5)
                
                Text(message)
                    .foregroundStyle(.gray)
                    .padding()
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
           toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
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

