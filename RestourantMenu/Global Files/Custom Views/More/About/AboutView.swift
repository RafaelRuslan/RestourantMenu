//
//  AboutView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 14.07.25.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form{
            Section(header: Text("About the App")) {
                Text("Restourant Menu - This app is made for Lana Dining and Launch")
                    .font(.body)
                    .bold()
            }
            Section(header: Text("Version")) {
                Text("4.1.0")
            }
            Section(header: Text("Developer")) {
                
                    Text("Developed by Rafael Agayev")
                    
                    Link("Instagram: RafaelAgayev", destination: URL(string: "https://www.instagram.com/r.a_rus")!)
                    
                    Link("Linkedin: Rafael Agayev", destination: URL(string: "https://www.linkedin.com/rafaelagayev")!)
               
            }
            Section{
                Link("Privacy Policy", destination: URL(string: "https://google.com/privacy")!)
                
                Link("Terms of Use", destination: URL(string: "https://google.com/terms")!)
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
            Text("About")
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

#Preview {
    AboutView()
}
