//
//  CommunicationView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 16.07.25.
//

import SwiftUI

struct CommunicationView: View {

    @State private var isEmailOn = false
    @State private var isPushOn = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Form{
            
            Section(header: Text("Lana's Preferences")){
                Text("If you're not a user of your other products, we'll send you offers we think you might enjoy")
            }
            Section(header: Text("Promotions and tips")){
                HStack{
                    Text("E-mail")
                        .font(.title3)
                    Spacer()
                    Toggle("", isOn: $isEmailOn)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                }
                HStack{
                    Text("Push Notifications")
                        .font(.title3)
                    Spacer()
                    Toggle("", isOn: $isPushOn)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
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
    CommunicationView()
}
