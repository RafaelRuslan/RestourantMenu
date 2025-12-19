//
//  PromocodesDetailView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct PromocodesDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm = PromocodeViewModel()
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 20) {
                
                TextField("Enter promocodes", text: $vm.promocode)
                    .textFieldModifier()
                    .textInputAutocapitalization(.never)
                    .onChange(of: vm.promocode) {
                        vm.enterButton = !vm.promocode.trimmingCharacters(in: .whitespaces).isEmpty
                       }
                
                Button{
                    vm.promoProblem()
                }label: {
                    Text("Enter")
                }
                .foregroundStyle(.colorWhite)
                .background(
                    Color.colorAccent
                        .frame(width: 200, height: 41)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 1.2)
                )
                .disabled(!vm.enterButton)
                .opacity(vm.enterButton ? 1 : 0.5)
                
                Text(vm.message)
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
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}

