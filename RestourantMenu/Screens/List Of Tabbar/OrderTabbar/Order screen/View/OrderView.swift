//
//  OrderView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 12.07.25.
//

import SwiftUI
import SwiftData

struct OrderView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    let orderVM: OrderViewModel
    
    @State private var navigateToHistory = false
    
    @Query private var model: [SwiftDataModel]
    
    @Environment(\.dismiss) private var dismiss
    
    init(orderVM: OrderViewModel) {
        self.orderVM = orderVM
    }
    
    
    var body: some View {
        VStack{
            OrderScreenSection(
                
                onDelete: { indexSet in
                    orderVM.deleteItems(at: indexSet)
                },
                navigateToHistory: $navigateToHistory,
                saveOrder: {
                    orderVM.saveOrder(modelContext: modelContext)
                },
                orderVM: orderVM
            )
        }
            .onAppear{
                orderVM.saveOrder(modelContext: modelContext)
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
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}
