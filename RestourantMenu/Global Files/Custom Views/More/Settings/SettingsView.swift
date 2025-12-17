//
//  SettingsView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var loginVM: LoginViewModel
    
    var body: some View {
            Form{
                List{
                    NavigationLink(destination: CommunicationView()){
                        Text("Communication")
                            .font(.title2)
                    }
                    NavigationLink(destination: VerificationView()) {
                        Text("Two-step verification")
                            .font(.title2)
                    }
                }
                Section(""){
                    List{
                        Button{
                            loginVM.deleteUser()
                        }label: {
                            Label("Delete account", systemImage: "trash.fill")
                                .button_Style()
                            
                        }
                    }
                }
                
            }
            .navigationBarBackButtonHidden()
            .toolbar{
                toolbar
            }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("Settings")
                .font(.title)
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
    

//#Preview {
//    SettingsView()
//}
