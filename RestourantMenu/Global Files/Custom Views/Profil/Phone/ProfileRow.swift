//
//  ProfileRow.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.12.25.
//

import SwiftUI

struct ProfileRow: View {
    let icon: String
    let text: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.blue)
                .font(.title2)
            Text(text)
                .font(.title2)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label:{
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}

