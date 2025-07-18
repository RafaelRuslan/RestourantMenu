//
//  VerificationView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 16.07.25.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                Text("Turn on two-step verification")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Add an extra layer of protection to keep your account secure")
                    .font(.title3)
                    .fontWeight(.medium)
                    
            }
            .padding()
            VStack(alignment: .trailing) {
                Text("Turn on")
                    .font(.title)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
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

#Preview {
    VerificationView()
}
