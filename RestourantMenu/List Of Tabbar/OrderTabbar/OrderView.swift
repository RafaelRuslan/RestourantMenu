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
    @EnvironmentObject private var order : OrderViewModel
    @State private var navigateToHistory = false
    @State private var isSelected = false
    @Query private var model: [SwiftDataModel]
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    if order.selectedItems.isEmpty {
                        Text("No orders yet.")
                            .foregroundStyle(.gray)
                    } else {
                        ForEach(order.selectedItems) { item in
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
                Button("Save and Navigate to History") {
                    order.saveOrder(modelContext: modelContext)
                    navigateToHistory = true
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                HStack {
                    Text("Total price:")
                        .font(.headline)
                    Spacer()
                    Text("\(order.total, format: .currency(code: "usd"))")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                }
                .padding()
                .background(Color(.systemGray6))
                
                NavigationLink("", destination: HistoryView()
                    .environment(\.modelContext, modelContext),
                               isActive: $navigateToHistory)
                .hidden()
            }
        }
    }
    private func deleteItems(at offsets: IndexSet){
        for index in offsets{
            let orderDelete = model[index]
            modelContext.delete(orderDelete)
        }
        do{
            try? modelContext.save()
        }catch{
            print("Error, no deleted")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(OrderViewModel()
                           )
}
