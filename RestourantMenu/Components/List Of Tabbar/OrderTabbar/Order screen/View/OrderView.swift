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
    
    @State private var isSelected = false
    
    @Query private var model: [SwiftDataModel]
    
    init(orderVM: OrderViewModel) {
        self.orderVM = orderVM
    }
    
    
    var body: some View {
//        NavigationStack{
            VStack {
                Spacer()
                if orderVM.selectedItems.isEmpty {
                    Text("No orders yet.")
                        .foregroundStyle(.gray)
                    } else {
                        List {
                        ForEach(orderVM.selectedItems) { item in
                            HStack(spacing: 12) {
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Text("x\(item.amount)")
                                    
                                    Text("\(item.originalPrice, format: .currency(code: "USD"))")
                                        .foregroundStyle(.secondary)
                                }
                            }
                            
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                Spacer()
                Button("History") {
                    orderVM.saveOrder(modelContext: modelContext)
                    navigateToHistory = true
                }
                .inputModifier()
                
                HStack {
                    Text("Total price:")
                        .font(.headline)
                    
                    Spacer()
                    Text("\(orderVM.total, format: .currency(code: "usd"))")
                        .fontModifier(size: 12, weight: .bold, foregroundColor: .colorBlack)
                }
                .padding()
                .background(Color(.systemGray6))
                .navigationDestination(isPresented: $navigateToHistory) {
                    HistoryView(orderVM: orderVM)
                        .environment(\.modelContext, modelContext)
                }
                .hidden()
            }
    }
    private func deleteItems(at offsets: IndexSet) {
        orderVM.selectedItems.remove(atOffsets: offsets)
    }
}

//#Preview {
//    OrderView()
//        .environmentObject(OrderViewModel())
//}
