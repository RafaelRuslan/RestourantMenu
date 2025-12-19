//
//  HelpView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 15.07.25.
//

import SwiftUI

struct HelpView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var vm = HelpViewModel()
    
    var body: some View {
        
        List{
            
            Section(header: Text("About the App")) {
                
                Text(vm.thisApp)
            }
            Section(header: Text("Using the App")) {
                
                Text(vm.searchApp)
                
                Text(vm.favApp)
                
                Text(vm.detailsApp)
            }
            Section(header: Text("Need Help?")) {
                
                Text(vm.connectionProblemApp)
                
                Link("Gmail: Rafael Agayev", destination: URL(string: vm.mailApp)!)
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
