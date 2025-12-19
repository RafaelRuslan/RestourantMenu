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
//        NavigationStack{
            VStack {
                Spacer()
                if orderVM.selectedItems.isEmpty {
                    Text("No orders yet.")
                        .foregroundStyle(.gray)
                        .font(.title2)
                    
                    Image(systemName: "basket.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.colorAccent)
                    } else {
                        List{
                        ForEach(orderVM.selectedItems) { item in
                            NavigationLink{
                                DetailsScreen(item: item, order: orderVM, showOrderButton: false)
                            }label:{
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
                       
                        .onDelete { indexSet in
                            orderVM.deleteItems(at: indexSet)
                        }
                    }
                }
                Spacer()
                Button {
                    orderVM.saveOrder(modelContext: modelContext)
                    navigateToHistory = true
                }label:{
                    Text("History")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .font(.system(size: 18, weight: .semibold))
                    
                    
                }
                .primaryActionModifier()
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding()
                
                
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

