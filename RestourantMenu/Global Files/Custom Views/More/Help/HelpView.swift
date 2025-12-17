//
//  HelpView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 15.07.25.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List{
            Section(header: Text("About the App")) {
                Text("This app allows you to browse our full restourant menu, view descriptions, and mark your favorite dishes.")
            }
            Section(header: Text("Using the App")) {
                Text("🔍 Search: Use the search bar to find dishes by name or ingredients.")
                Text("♥️ Favorites: Tap the heart icon to save dishes you love.")
                Text("📦 Details: Tap a dish to view full information.")
            }
            Section(header: Text("Need Help?")) {
                Text("If something isn't working, check your internet connection or contact us.")
                Text("📬 rafaretti2021@gmail.com")
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
            Text("Help")
                .bold()
                .font(.largeTitle)
        }
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    HelpView()
}
