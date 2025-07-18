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
                Text("3.34.11")
            }
            Section(header: Text("Developer")) {
                VStack(alignment: .leading) {
                    Text("Developed by Rafael Agayev")
                    Text("E-mail: rafaretti2021@gmail.com")
                    Text("Linkedin: Rafael Agayev")
                }
                .font(.footnote)
                .bold()
            }
            Section{
                Link("Privacy Policy", destination: URL(string: "https://google.com/privacy")!)
                Link("Terms of Use", destination: URL(string: "https://google.com/terms")!)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
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
}

#Preview {
    AboutView()
}
