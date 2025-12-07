//
//  LogoutView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 17.08.25.
//

import SwiftUI

struct LogoutView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var vm = LogoutViewModel()
    
    @AppStorage(.language) private var language = "az"

    var body: some View {
        VStack(alignment: .center, spacing: 8){
            TextField("Enter e-Mail...", text: $vm.profile.name)
                .userModifier()
                .padding(1)
                
            
            SecureField("Enter Password...", text: $vm.profile.password)
                .userModifier()
                .keyboardType(.default)
                
            Button{
                vm.validate()
           } label: {
               Text("Login")
                   .foregroundStyle(.white)
                   .background{
                       Color.blue
                           .frame(width: 300, height: 41)
                           .clipShape(RoundedRectangle(cornerRadius: 12))
                           .shadow(radius: 0.4)
                   }
                   .disabled(!vm.isEnter)
                   .opacity(vm.isEnter ? 1 : 0.5)
           }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .alert(vm.alertSuccess ? "Success" : "Wrong", isPresented: $vm.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(vm.alertMessage)
        }
        
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("Enter app")
                .font(.title2)
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

