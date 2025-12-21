//
//  OrderScreenSection.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI
import SwiftData

struct OrderScreenSection: View {
    
    @Environment(\.modelContext) private var modelContext
    
    var onDelete: (IndexSet) -> Void
    
    @Binding var navigateToHistory: Bool
    
    var saveOrder: () -> Void
    
    let orderVM: OrderViewModel
    
    var total: Double {
        orderVM.selectedItems.reduce(0) { result, item in
            let price = item.discountedPrice ?? item.originalPrice
            return result + price * Double(item.amount)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if orderVM.selectedItems.isEmpty {
                Spacer()
                VStack(spacing: 16) {
                    Text("No orders yet.")
                        .foregroundStyle(.gray)
                        .font(.title2)
                    Image(systemName: "basket.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.colorAccent)
                }
                Spacer()
            } else {
                List {
                    ForEach(orderVM.selectedItems) { item in
                        NavigationLink {
                            DetailsScreen(item: item, order: orderVM, showOrderButton: false)
                        } label: {
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
                    }
                    .onDelete { index in
                        onDelete(index)
                    }
                }
                .listStyle(PlainListStyle())
            }
            
            VStack(spacing: 8) {
                HStack {
                    Text("Total price:")
                        .font(.headline)
                    Spacer()
                    Text("\(total, format: .currency(code: "USD"))")
                        .fontModifier(size: 12, weight: .bold, foregroundColor: .colorBlack)
                }
                .padding()
                .background(Color(.systemGray6))
                
                Button {
                    saveOrder()
                    navigateToHistory = true
                } label: {
                    Text("History")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .font(.system(size: 18, weight: .semibold))
                }
                .primaryActionModifier()
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal)
            }
        }
        .navigationDestination(isPresented: $navigateToHistory) {
            HistoryView(orderVM: orderVM)
                .environment(\.modelContext, modelContext)
        }
    }
}
