//
//  MenuItemRowView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI

struct MenuItemRowView: View {
    @EnvironmentObject var orderManager: OrderViewModel
    var item: MenuModel
    @ObservedObject var viewModel: MenuViewModel
   
    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .imageModify()
            VStack(alignment: .leading, spacing: 4){
                Text(item.name)
                    .font(.headline)
                HStack{
                    if let discount = item.discountedPrice {
                        Text("\(item.originalPrice, format: .currency(code: "USD"))")
                            .priceModify()
                        Text("\(discount, format: .currency(code: "USD"))")
                            .foregroundStyle(.red)
                            .fontWeight(.bold)
                    }else{
                        Text("\(item.originalPrice, format: .currency(code: "USD"))")
                            .fontWeight(.bold)
                    }
                }
            }
            Spacer()
            
            HStack(spacing: 8) {
                Button{
                    viewModel.decrement(for: item)
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .minusModify()
                }
                Text("\(viewModel.items.first(where: { $0.id == item.id })?.amount ?? 0)")
                        .font(.title2)
                        .foregroundStyle(.black)
                Button {
                    viewModel.increment(for: item)
                    orderManager.addToOrder(item)
                }label:{
                    Image(systemName: "plus.circle.fill")
                        .plusModify()
                }
            }
        }
        .paddingModify()
    }
}
