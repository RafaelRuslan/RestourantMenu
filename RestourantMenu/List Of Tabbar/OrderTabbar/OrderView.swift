//
//  OrderView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 12.07.25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject private var order : OrderViewModel
    @State private var quantity: Int = 0
    
    var body: some View {
        List{
            
            if order.selectedItems.isEmpty{
                Text("No orders yet.")
                    .foregroundStyle(.gray)
            }else{
                ForEach(order.selectedItems ){ item in
                    HStack(spacing: 12) {
                        
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: 60,
                                height: 60
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        VStack(alignment: .leading){
                            Text("\(item.name) - $\(item.originalPrice, specifier: "%.2f")")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Your order")
                    .font(.headline)
                    .bold()
            }
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(OrderViewModel())
}
