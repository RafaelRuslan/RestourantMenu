//
//  MenuItemRowView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI

struct MenuItemRowView: View {
    
    let orderVM: OrderViewModel
    
    var item: MenuModel
    
    @ObservedObject var viewModel: MenuViewModel
    
    init(orderVM: OrderViewModel, item: MenuModel, viewModel: MenuViewModel) {
        self.orderVM = orderVM
        self.item = item
        self.viewModel = viewModel
    }
   
    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .imageModify()
            VStack(alignment: .leading, spacing: 4){
                Text(item.name)
                    .font(.headline)
                    .lineLimit(1)
                HStack{
                    if let discount = item.discountedPrice {
                        Text("\(item.originalPrice, format: .currency(code: "USD"))")
                            .priceModify()
                            .lineLimit(1)
                        Text("\(discount, format: .currency(code: "USD"))")
                            .foregroundStyle(.colorRedOpacity)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }else{
                        Text("\(item.originalPrice, format: .currency(code: "USD"))")
                            .fontWeight(.bold)
                            .lineLimit(1)
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
                    orderVM.addToOrder(item)
                }label:{
                    Image(systemName: "plus.circle.fill")
                        .plusModify()
                }
            }
        }
        .paddingModify()
    }
}
